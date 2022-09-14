import '../../notion.dart';

class Breadcrumb {
  final Map<String, dynamic> data;

  Notion? notion;

  Breadcrumb(this.data);

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return Breadcrumb(json);
  }

  Map<String, dynamic> toJson() => data;

  Breadcrumb copy() => Breadcrumb.fromJson(toJson());
}
