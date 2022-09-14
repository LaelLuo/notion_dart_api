import '../../notion.dart';

class Properties {
  final Map<String, dynamic> data;

  Notion? notion;

  Properties(this.data);

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(json);
  }

  Map<String, dynamic> toJson() => data;

  Properties copy() => Properties.fromJson(toJson());
}
