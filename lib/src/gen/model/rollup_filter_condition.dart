import './date_filter_condition.dart';
import './filter.dart';
import './number_filter_condition.dart';
import '../../notion.dart';

class RollupFilterCondition {
  Filter? any;

  Filter? every;

  Filter? none;

  NumberFilterCondition? number;

  DateFilterCondition? date;

  Notion? notion;

  RollupFilterCondition({
    this.any,
    this.every,
    this.none,
    this.number,
    this.date,
  });

  factory RollupFilterCondition.fromJson(Map<String, dynamic> json) {
    return RollupFilterCondition(
      any: json['any'] == null ? null : Filter.fromJson(json['any']),
      every: json['every'] == null ? null : Filter.fromJson(json['every']),
      none: json['none'] == null ? null : Filter.fromJson(json['none']),
      number: json['number'] == null ? null : NumberFilterCondition.fromJson(json['number']),
      date: json['date'] == null ? null : DateFilterCondition.fromJson(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(any != null) jsonData['any'] = any?.toJson();
    if(every != null) jsonData['every'] = every?.toJson();
    if(none != null) jsonData['none'] = none?.toJson();
    if(number != null) jsonData['number'] = number?.toJson();
    if(date != null) jsonData['date'] = date?.toJson();
    return jsonData;
  }

  RollupFilterCondition copy() => RollupFilterCondition.fromJson(toJson());
}
