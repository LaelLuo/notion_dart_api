import 'common.dart';
import '../../notion.dart';

class Parent {
  String? type;

  String? databaseId;

  String? blockId;

  bool? workspace;

  String? pageId;

  Notion? notion;

  Parent({
    this.type,
    this.databaseId,
    this.blockId,
    this.workspace,
    this.pageId,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      type: as<String?>(json['type']),
      databaseId: as<String?>(json['database_id']),
      blockId: as<String?>(json['block_id']),
      workspace: as<bool?>(json['workspace']),
      pageId: as<String?>(json['page_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(databaseId != null) jsonData['database_id'] = databaseId;
    if(blockId != null) jsonData['block_id'] = blockId;
    if(workspace != null) jsonData['workspace'] = workspace;
    if(pageId != null) jsonData['page_id'] = pageId;
    return jsonData;
  }

  Parent copy() => Parent.fromJson(toJson());
}
