import '../../notion.dart';

class NextMonth {
  final Map<String, dynamic> data;

  Notion? notion;

  NextMonth(this.data);

  factory NextMonth.fromJson(Map<String, dynamic> json) {
    return NextMonth(json);
  }

  Map<String, dynamic> toJson() => data;

  NextMonth copy() => NextMonth.fromJson(toJson());
}
