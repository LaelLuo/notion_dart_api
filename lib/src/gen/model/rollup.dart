import 'common.dart';
import '../../notion.dart';

class Rollup {
  String? relationPropertyName;

  String? relationPropertyId;

  String? rollupPropertyName;

  String? rollupPropertyId;

  String? function;

  Notion? notion;

  Rollup({
    this.relationPropertyName,
    this.relationPropertyId,
    this.rollupPropertyName,
    this.rollupPropertyId,
    this.function,
  });

  factory Rollup.fromJson(Map<String, dynamic> json) {
    return Rollup(
      relationPropertyName: as<String?>(json['relation_property_name']),
      relationPropertyId: as<String?>(json['relation_property_id']),
      rollupPropertyName: as<String?>(json['rollup_property_name']),
      rollupPropertyId: as<String?>(json['rollup_property_id']),
      function: as<String?>(json['function']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(relationPropertyName != null) jsonData['relation_property_name'] = relationPropertyName;
    if(relationPropertyId != null) jsonData['relation_property_id'] = relationPropertyId;
    if(rollupPropertyName != null) jsonData['rollup_property_name'] = rollupPropertyName;
    if(rollupPropertyId != null) jsonData['rollup_property_id'] = rollupPropertyId;
    if(function != null) jsonData['function'] = function;
    return jsonData;
  }

  Rollup copy() => Rollup.fromJson(toJson());
}
