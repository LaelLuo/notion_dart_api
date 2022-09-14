import 'common.dart';
import '../../notion.dart';

class SelectFilterCondition {
  String? equals;

  String? doesNotEqual;

  bool? isEmpty;

  bool? isNotEmpty;

  Notion? notion;

  SelectFilterCondition({
    this.equals,
    this.doesNotEqual,
    this.isEmpty,
    this.isNotEmpty,
  });

  factory SelectFilterCondition.fromJson(Map<String, dynamic> json) {
    return SelectFilterCondition(
      equals: as<String?>(json['equals']),
      doesNotEqual: as<String?>(json['does_not_equal']),
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(equals != null) jsonData['equals'] = equals;
    if(doesNotEqual != null) jsonData['does_not_equal'] = doesNotEqual;
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    return jsonData;
  }

  SelectFilterCondition copy() => SelectFilterCondition.fromJson(toJson());
}
