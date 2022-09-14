import '../../notion.dart';

class PastYear {
  final Map<String, dynamic> data;

  Notion? notion;

  PastYear(this.data);

  factory PastYear.fromJson(Map<String, dynamic> json) {
    return PastYear(json);
  }

  Map<String, dynamic> toJson() => data;

  PastYear copy() => PastYear.fromJson(toJson());
}
