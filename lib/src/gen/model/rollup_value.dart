import './date.dart';
import 'common.dart';
import '../../notion.dart';

class RollupValue {
  String? type;

  String? function;

  String? string;

  double? number;

  Date? date;

  List<String>? results;

  Notion? notion;

  RollupValue({
    this.type,
    this.function,
    this.string,
    this.number,
    this.date,
    this.results,
  });

  factory RollupValue.fromJson(Map<String, dynamic> json) {
    return RollupValue(
      type: as<String?>(json['type']),
      function: as<String?>(json['function']),
      string: as<String?>(json['string']),
      number: as<double?>(json['number']),
      date: json['date'] == null ? null : Date.fromJson(json['date']),
      results: (json['results'] as List?)?.map((item) => as<String>(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(function != null) jsonData['function'] = function;
    if(string != null) jsonData['string'] = string;
    if(number != null) jsonData['number'] = number;
    if(date != null) jsonData['date'] = date?.toJson();
    if(results != null) jsonData['results'] = results?.map((v) => v).toList();
    return jsonData;
  }

  RollupValue copy() => RollupValue.fromJson(toJson());
}
