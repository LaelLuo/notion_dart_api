import './property.dart';
import '../../notion.dart';

class Properties {
  final Map<String, Property> data;

  Notion? notion;

  Properties(this.data);

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties({
      for (final e in json.entries) e.key: Property.fromJson(e.value),
    });
  }
  Map<String, dynamic> toJson() {
    return {
      for (final e in data.entries) e.key: e.value.toJson(),
    };
  }

  Properties copy() => Properties.fromJson(toJson());
}
