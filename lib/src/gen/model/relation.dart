import 'common.dart';
import '../../notion.dart';

class Relation {
  String? databaseId;

  String? type;

  String? syncedPropertyName;

  String? syncedPropertyId;

  Notion? notion;

  Relation({
    this.databaseId,
    this.type,
    this.syncedPropertyName,
    this.syncedPropertyId,
  });

  factory Relation.fromJson(Map<String, dynamic> json) {
    return Relation(
      databaseId: as<String?>(json['database_id']),
      type: as<String?>(json['type']),
      syncedPropertyName: as<String?>(json['synced_property_name']),
      syncedPropertyId: as<String?>(json['synced_property_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(databaseId != null) jsonData['database_id'] = databaseId;
    if(type != null) jsonData['type'] = type;
    if(syncedPropertyName != null) jsonData['synced_property_name'] = syncedPropertyName;
    if(syncedPropertyId != null) jsonData['synced_property_id'] = syncedPropertyId;
    return jsonData;
  }

  Relation copy() => Relation.fromJson(toJson());
}
