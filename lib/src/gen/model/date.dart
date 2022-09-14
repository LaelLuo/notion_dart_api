import 'common.dart';
import '../../notion.dart';

class Date {
  String? start;

  String? end;

  String? timeZone;

  Notion? notion;

  Date({
    this.start,
    this.end,
    this.timeZone,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      start: as<String?>(json['start']),
      end: as<String?>(json['end']),
      timeZone: as<String?>(json['time_zone']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(start != null) jsonData['start'] = start;
    if(end != null) jsonData['end'] = end;
    if(timeZone != null) jsonData['time_zone'] = timeZone;
    return jsonData;
  }

  Date copy() => Date.fromJson(toJson());
}
