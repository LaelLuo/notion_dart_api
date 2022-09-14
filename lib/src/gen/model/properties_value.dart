import './property_value.dart';
import '../../notion.dart';

class PropertiesValue {
  final Map<String, PropertyValue> data;

  Notion? notion;

  PropertiesValue(this.data);

  factory PropertiesValue.fromJson(Map<String, dynamic> json) {
    return PropertiesValue({
      for (final e in json.entries) e.key: PropertyValue.fromJson(e.value),
    });
  }
  Map<String, dynamic> toJson() {
    return {
      for (final e in data.entries) e.key: e.value.toJson(),
    };
  }

  PropertiesValue copy() => PropertiesValue.fromJson(toJson());
}
