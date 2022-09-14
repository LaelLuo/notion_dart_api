import './block.dart';
import './synced_from.dart';
import '../../notion.dart';

class SyncedBlock {
  SyncedFrom? syncedFrom;

  List<Block>? children;

  Notion? notion;

  SyncedBlock({
    this.syncedFrom,
    this.children,
  });

  factory SyncedBlock.fromJson(Map<String, dynamic> json) {
    return SyncedBlock(
      syncedFrom: json['synced_from'] == null ? null : SyncedFrom.fromJson(json['synced_from']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(syncedFrom != null) jsonData['synced_from'] = syncedFrom?.toJson();
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  SyncedBlock copy() => SyncedBlock.fromJson(toJson());
}
