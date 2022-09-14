import '../../notion.dart';

class Divider {
  final Map<String, dynamic> data;

  Notion? notion;

  Divider(this.data);

  factory Divider.fromJson(Map<String, dynamic> json) {
    return Divider(json);
  }

  Map<String, dynamic> toJson() => data;

  Divider copy() => Divider.fromJson(toJson());
}
