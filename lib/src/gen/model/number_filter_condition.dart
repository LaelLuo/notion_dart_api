import 'common.dart';
import '../../notion.dart';

class NumberFilterCondition {
  double? equals;

  double? doesNotEqual;

  double? greaterThan;

  double? lessThan;

  double? greaterThanOrEqualTo;

  double? lessThanOrEqualTo;

  bool? isEmpty;

  bool? isNotEmpty;

  Notion? notion;

  NumberFilterCondition({
    this.equals,
    this.doesNotEqual,
    this.greaterThan,
    this.lessThan,
    this.greaterThanOrEqualTo,
    this.lessThanOrEqualTo,
    this.isEmpty,
    this.isNotEmpty,
  });

  factory NumberFilterCondition.fromJson(Map<String, dynamic> json) {
    return NumberFilterCondition(
      equals: as<double?>(json['equals']),
      doesNotEqual: as<double?>(json['does_not_equal']),
      greaterThan: as<double?>(json['greater_than']),
      lessThan: as<double?>(json['less_than']),
      greaterThanOrEqualTo: as<double?>(json['greater_than_or_equal_to']),
      lessThanOrEqualTo: as<double?>(json['less_than_or_equal_to']),
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(equals != null) jsonData['equals'] = equals;
    if(doesNotEqual != null) jsonData['does_not_equal'] = doesNotEqual;
    if(greaterThan != null) jsonData['greater_than'] = greaterThan;
    if(lessThan != null) jsonData['less_than'] = lessThan;
    if(greaterThanOrEqualTo != null) jsonData['greater_than_or_equal_to'] = greaterThanOrEqualTo;
    if(lessThanOrEqualTo != null) jsonData['less_than_or_equal_to'] = lessThanOrEqualTo;
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    return jsonData;
  }

  NumberFilterCondition copy() => NumberFilterCondition.fromJson(toJson());
}
