import 'common.dart';
import '../../notion.dart';

class SyncedFrom {
  String? type;

  String? blockId;

  Notion? notion;

  SyncedFrom({
    this.type,
    this.blockId,
  });

  factory SyncedFrom.fromJson(Map<String, dynamic> json) {
    return SyncedFrom(
      type: as<String?>(json['type']),
      blockId: as<String?>(json['block_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(blockId != null) jsonData['block_id'] = blockId;
    return jsonData;
  }

  SyncedFrom copy() => SyncedFrom.fromJson(toJson());
}
