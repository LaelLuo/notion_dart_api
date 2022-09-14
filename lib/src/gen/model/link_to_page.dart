import 'common.dart';
import '../../notion.dart';

class LinkToPage {
  String? type;

  String? pageId;

  String? databaseId;

  Notion? notion;

  LinkToPage({
    this.type,
    this.pageId,
    this.databaseId,
  });

  factory LinkToPage.fromJson(Map<String, dynamic> json) {
    return LinkToPage(
      type: as<String?>(json['type']),
      pageId: as<String?>(json['page_id']),
      databaseId: as<String?>(json['database_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(pageId != null) jsonData['page_id'] = pageId;
    if(databaseId != null) jsonData['database_id'] = databaseId;
    return jsonData;
  }

  LinkToPage copy() => LinkToPage.fromJson(toJson());
}
