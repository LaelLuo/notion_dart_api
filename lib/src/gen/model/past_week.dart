import '../../notion.dart';

class PastWeek {
  final Map<String, dynamic> data;

  Notion? notion;

  PastWeek(this.data);

  factory PastWeek.fromJson(Map<String, dynamic> json) {
    return PastWeek(json);
  }

  Map<String, dynamic> toJson() => data;

  PastWeek copy() => PastWeek.fromJson(toJson());
}
