import 'package:path/path.dart' as p;

import 'gen/model/index.dart';
import 'mimetype.dart';
import 'notion_list.dart';
import 'typedef.dart';

class Extension {}

extension DatabaseExt on Database {
  Future<List<Page>> children() async {
    final response = await notion?.officialDio.post('/databases/$id/query');
    final result = NotionList<Page>.fromJson(response!.data).results;
    for (final e in result) {
      notion?.pageCache[e.id!] = e;
    }
    return result;
  }
}

extension DateTimeExt on DateTime {
  String get notionDateString => '${year.format(4)}-${month.format(2)}-${day.format(2)}';
}

extension IntExt on int {
  String format(int width) => toString().padLeft(width, '0');
}

extension JsonMapExt on JsonMap {
  int getInt(String key) => this[key];

  JsonList getList(String key) => this[key];

  JsonMap getMap(String key) => this[key];

  String getString(String key) => this[key];
}

extension PageExt on Page {}

extension PropertiesValueExt on PropertiesValue {
  String? get titlePlainText => get('Name').title?.map((e) => e.plainText).join();
  PropertyValue get(String key) => data[key]!;
}

extension PropertyValueExt on PropertyValue {}

extension StringExt on String {
  String get ext => p.extension(this).substring(1).toLowerCase();

  String get firstCharLowerCase {
    return this[0].toLowerCase() + substring(1);
  }

  String get firstCharUpperCase {
    return this[0].toUpperCase() + substring(1);
  }

  String get lowerCamelCase => upperCamelCase.firstCharLowerCase;

  String get mimetype => mimeMap[ext] ?? 'text/plain';

  String get name => p.basename(this);

  String get nameWithoutExt => p.basenameWithoutExtension(this);

  String get underLine {
    var source = lowerCamelCase;
    var result = [];
    var temp = '';
    for (var i = 0; i < source.length; i++) {
      var char = source[i];
      if (char != char.toUpperCase()) {
        temp += char;
      } else {
        result.add(temp);
        temp = char.toLowerCase();
      }
    }
    result.add(temp);
    return result.join('_');
  }

  String get upperCamelCase {
    String? tag;
    if (contains('_')) tag = '_';
    if (contains('-')) tag = '-';
    if (tag == null) return this;
    return split(tag).map((e) => e.firstCharUpperCase).join();
  }
}