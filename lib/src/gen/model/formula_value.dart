import './date.dart';
import 'common.dart';
import '../../notion.dart';

class FormulaValue {
  String? type;

  double? number;

  String? string;

  bool? boolean;

  Date? date;

  Notion? notion;

  FormulaValue({
    this.type,
    this.number,
    this.string,
    this.boolean,
    this.date,
  });

  factory FormulaValue.fromJson(Map<String, dynamic> json) {
    return FormulaValue(
      type: as<String?>(json['type']),
      number: as<double?>(json['number']),
      string: as<String?>(json['string']),
      boolean: as<bool?>(json['boolean']),
      date: json['date'] == null ? null : Date.fromJson(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(number != null) jsonData['number'] = number;
    if(string != null) jsonData['string'] = string;
    if(boolean != null) jsonData['boolean'] = boolean;
    if(date != null) jsonData['date'] = date?.toJson();
    return jsonData;
  }

  FormulaValue copy() => FormulaValue.fromJson(toJson());
}
