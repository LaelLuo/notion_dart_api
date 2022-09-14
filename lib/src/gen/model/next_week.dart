import '../../notion.dart';

class NextWeek {
  final Map<String, dynamic> data;

  Notion? notion;

  NextWeek(this.data);

  factory NextWeek.fromJson(Map<String, dynamic> json) {
    return NextWeek(json);
  }

  Map<String, dynamic> toJson() => data;

  NextWeek copy() => NextWeek.fromJson(toJson());
}
