import 'common.dart';
import '../../notion.dart';

class StatusGroups {
  String? name;

  String? id;

  String? color;

  String? optionIds;

  Notion? notion;

  StatusGroups({
    this.name,
    this.id,
    this.color,
    this.optionIds,
  });

  factory StatusGroups.fromJson(Map<String, dynamic> json) {
    return StatusGroups(
      name: as<String?>(json['name']),
      id: as<String?>(json['id']),
      color: as<String?>(json['color']),
      optionIds: as<String?>(json['option_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(name != null) jsonData['name'] = name;
    if(id != null) jsonData['id'] = id;
    if(color != null) jsonData['color'] = color;
    if(optionIds != null) jsonData['option_ids'] = optionIds;
    return jsonData;
  }

  StatusGroups copy() => StatusGroups.fromJson(toJson());
}
