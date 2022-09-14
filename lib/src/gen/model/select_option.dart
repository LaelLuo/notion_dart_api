import 'common.dart';
import '../../notion.dart';

class SelectOption {
  String? name;

  String? id;

  String? color;

  Notion? notion;

  SelectOption({
    this.name,
    this.id,
    this.color,
  });

  factory SelectOption.fromJson(Map<String, dynamic> json) {
    return SelectOption(
      name: as<String?>(json['name']),
      id: as<String?>(json['id']),
      color: as<String?>(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(name != null) jsonData['name'] = name;
    if(id != null) jsonData['id'] = id;
    if(color != null) jsonData['color'] = color;
    return jsonData;
  }

  SelectOption copy() => SelectOption.fromJson(toJson());
}
