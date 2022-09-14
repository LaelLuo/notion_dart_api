import '../../notion.dart';

class PastMonth {
  final Map<String, dynamic> data;

  Notion? notion;

  PastMonth(this.data);

  factory PastMonth.fromJson(Map<String, dynamic> json) {
    return PastMonth(json);
  }

  Map<String, dynamic> toJson() => data;

  PastMonth copy() => PastMonth.fromJson(toJson());
}
