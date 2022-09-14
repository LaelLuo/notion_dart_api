import '../../notion.dart';

class NextYear {
  final Map<String, dynamic> data;

  Notion? notion;

  NextYear(this.data);

  factory NextYear.fromJson(Map<String, dynamic> json) {
    return NextYear(json);
  }

  Map<String, dynamic> toJson() => data;

  NextYear copy() => NextYear.fromJson(toJson());
}
