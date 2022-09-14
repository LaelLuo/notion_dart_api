import './next_month.dart';
import './next_week.dart';
import './next_year.dart';
import './past_month.dart';
import './past_week.dart';
import './past_year.dart';
import 'common.dart';
import '../../notion.dart';

class DateFilterCondition {
  String? equals;

  String? before;

  String? after;

  String? onOrBefore;

  bool? isEmpty;

  bool? isNotEmpty;

  String? onOrAfter;

  PastWeek? pastWeek;

  PastMonth? pastMonth;

  PastYear? pastYear;

  NextWeek? nextWeek;

  NextMonth? nextMonth;

  NextYear? nextYear;

  Notion? notion;

  DateFilterCondition({
    this.equals,
    this.before,
    this.after,
    this.onOrBefore,
    this.isEmpty,
    this.isNotEmpty,
    this.onOrAfter,
    this.pastWeek,
    this.pastMonth,
    this.pastYear,
    this.nextWeek,
    this.nextMonth,
    this.nextYear,
  });

  factory DateFilterCondition.fromJson(Map<String, dynamic> json) {
    return DateFilterCondition(
      equals: as<String?>(json['equals']),
      before: as<String?>(json['before']),
      after: as<String?>(json['after']),
      onOrBefore: as<String?>(json['on_or_before']),
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
      onOrAfter: as<String?>(json['on_or_after']),
      pastWeek: json['past_week'] == null ? null : PastWeek.fromJson(json['past_week']),
      pastMonth: json['past_month'] == null ? null : PastMonth.fromJson(json['past_month']),
      pastYear: json['past_year'] == null ? null : PastYear.fromJson(json['past_year']),
      nextWeek: json['next_week'] == null ? null : NextWeek.fromJson(json['next_week']),
      nextMonth: json['next_month'] == null ? null : NextMonth.fromJson(json['next_month']),
      nextYear: json['next_year'] == null ? null : NextYear.fromJson(json['next_year']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(equals != null) jsonData['equals'] = equals;
    if(before != null) jsonData['before'] = before;
    if(after != null) jsonData['after'] = after;
    if(onOrBefore != null) jsonData['on_or_before'] = onOrBefore;
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    if(onOrAfter != null) jsonData['on_or_after'] = onOrAfter;
    if(pastWeek != null) jsonData['past_week'] = pastWeek?.toJson();
    if(pastMonth != null) jsonData['past_month'] = pastMonth?.toJson();
    if(pastYear != null) jsonData['past_year'] = pastYear?.toJson();
    if(nextWeek != null) jsonData['next_week'] = nextWeek?.toJson();
    if(nextMonth != null) jsonData['next_month'] = nextMonth?.toJson();
    if(nextYear != null) jsonData['next_year'] = nextYear?.toJson();
    return jsonData;
  }

  DateFilterCondition copy() => DateFilterCondition.fromJson(toJson());
}
