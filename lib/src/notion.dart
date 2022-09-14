import 'dart:io';

import 'package:dio/dio.dart';

import 'extension.dart';
import 'gen/model/index.dart';
import 'utils.dart';

class Notion {
  ///Apply on the official website
  final String officialToken;

  ///token_v2 from cookie
  String? unofficialToken;
  bool verbose = false;

  late final Dio officialDio;

  late final Dio? _unofficialDio;

  final blockCache = <String, Block>{};

  final databaseCache = <String, Database>{};

  final pageCache = <String, Page>{};

  Notion({
    required this.officialToken,
    this.unofficialToken,
  }) {
    officialDio = Dio(BaseOptions(baseUrl: 'https://api.notion.com/v1'));
    officialDio.interceptors.add(InterceptorsWrapper(onResponse: (e, handler) {
      if (verbose) {
        print('${e.requestOptions.method} ${e.requestOptions.uri}');
        printJson(e.data);
      }
      handler.next(e);
    }, onError: (e, handler) {
      if (verbose) print(e.response?.data['message']);
      handler.next(e);
    }));
    changeOptions(officialDio, (options) {
      options.headers.addAll({
        'Authorization': 'Bearer $officialToken',
        'Notion-Version': '2022-06-28',
        'Content-Type': 'application/json',
      });
    });
    if (unofficialToken == null) {
      _unofficialDio = null;
      return;
    }
    _unofficialDio = Dio(BaseOptions(baseUrl: 'https://www.notion.so/api/v3'));
    changeOptions(_unofficialDio!, (options) {
      options.headers.addAll({
        'Cookie': 'token_v2=$unofficialToken',
      });
    });
    _unofficialDio!.interceptors.add(InterceptorsWrapper(onResponse: (e, handler) {
      if (verbose) {
        print('${e.requestOptions.method} ${e.requestOptions.uri}');
        printJson(e.data);
      }
      handler.next(e);
    }, onError: (e, handler) {
      if (verbose) print(e.response?.data['message']);
      handler.next(e);
    }));
  }

  Dio get unofficialDio {
    if (_unofficialDio == null) throw 'give me yout token_v2 pls';
    return _unofficialDio!;
  }

  Future<User> whoami() async {
    final response = await officialDio.get('/users/me');
    return User.fromJson(response.data);
  }

  String? _spaceId;

  Future<void> _ensureSpaceId() async {
    if (_spaceId != null) return;
    final response = await unofficialDio.post('/getSpaces', data: {});
    Map<String, dynamic> data = response.data;
    Map<String, dynamic> space = data.values.first['space'];
    _spaceId = space.keys.first;
  }

  Future<void> clear() async {
    await _ensureSpaceId();
    final response = await unofficialDio.post('/search', data: {
      "type": "BlocksInSpace",
      "query": "",
      "filters": {
        "isDeletedOnly": true,
        "excludeTemplates": false,
        "isNavigableOnly": false,
        "navigableBlockContentOnly": true,
        "requireEditPermissions": false,
        "ancestors": [],
        "createdBy": [],
        "editedBy": [],
        "lastEditedTime": {},
        "createdTime": {},
        "inTeams": []
      },
      "sort": "Relevance",
      "limit": 100,
      "spaceId": _spaceId,
      "source": "trash",
    });
    for (final item in (response.data['results'] as List)) {
      await _delete(item['id']);
    }
  }

  Future<void> _delete(String id) async {
    await _ensureSpaceId();
    await unofficialDio.post('/deleteBlocks', data: {
      "blocks": [
        {
          "id": id,
          "spaceId": _spaceId,
        }
      ],
      "permanentlyDelete": true,
    });
  }

  void dispose() {
    officialDio.close(force: true);
    _unofficialDio?.close(force: true);
  }

  Future<Block> getBlock(String blockId) async {
    final cache = blockCache[blockId];
    if (cache != null) return cache;
    final response = await officialDio.get('/blocks/$blockId');
    final data = response.data;
    final result = Block.fromJson(data)..notion = this;
    blockCache[blockId] = result;
    return result;
  }

  Future<Database> getDatabase(String databaseId) async {
    final cache = databaseCache[databaseId];
    if (cache != null) return cache;
    final response = await officialDio.get('/databases/$databaseId');
    final data = response.data;
    final result = Database.fromJson(data)..notion = this;
    databaseCache[databaseId] = result;
    return result;
  }

  Future<Page> getPage(String pageId) async {
    final cache = pageCache[pageId];
    if (cache != null) return cache;
    final response = await officialDio.get('/pages/$pageId');
    final data = response.data;
    final result = Page.fromJson(data)..notion = this;
    pageCache[pageId] = result;
    return result;
  }

  Future<Page> updatePage(Page page) async {
    final response = await (page.id == null ? officialDio.post('/pages', data: page.toJson()) : officialDio.patch('/pages/${page.id}', data: page.toJson()));
    final result = Page.fromJson(response.data);
    result.notion = this;
    pageCache[result.id!] = page;
    return result;
  }

  Future<String> uploadFile(File file) async {
    final contentLength = (await file.stat()).size;
    final mimeType = file.path.mimetype;
    final getUploadFileResponse = await unofficialDio.post('/getUploadFileUrl', data: {
      'bucket': 'secure',
      'name': file.path.name,
      'contentLength': contentLength,
      'contentType': mimeType,
    });
    final String putUrl = getUploadFileResponse.data['signedPutUrl'];
    final String url = getUploadFileResponse.data['url'];
    await unofficialDio.put(
      putUrl,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: mimeType,
        HttpHeaders.contentLengthHeader: contentLength,
      }),
      data: file.openRead(),
    );
    return url;
  }
}
