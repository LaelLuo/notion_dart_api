import './checkbox_filter_condition.dart';
import './date_filter_condition.dart';
import './number_filter_condition.dart';
import './text_filter_condition.dart';
import '../../notion.dart';

class FormulaFilterCondition {
  TextFilterCondition? string;

  CheckboxFilterCondition? checkbox;

  NumberFilterCondition? number;

  DateFilterCondition? date;

  Notion? notion;

  FormulaFilterCondition({
    this.string,
    this.checkbox,
    this.number,
    this.date,
  });

  factory FormulaFilterCondition.fromJson(Map<String, dynamic> json) {
    return FormulaFilterCondition(
      string: json['string'] == null ? null : TextFilterCondition.fromJson(json['string']),
      checkbox: json['checkbox'] == null ? null : CheckboxFilterCondition.fromJson(json['checkbox']),
      number: json['number'] == null ? null : NumberFilterCondition.fromJson(json['number']),
      date: json['date'] == null ? null : DateFilterCondition.fromJson(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(string != null) jsonData['string'] = string?.toJson();
    if(checkbox != null) jsonData['checkbox'] = checkbox?.toJson();
    if(number != null) jsonData['number'] = number?.toJson();
    if(date != null) jsonData['date'] = date?.toJson();
    return jsonData;
  }

  FormulaFilterCondition copy() => FormulaFilterCondition.fromJson(toJson());
}
