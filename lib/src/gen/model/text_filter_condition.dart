import 'common.dart';
import '../../notion.dart';

class TextFilterCondition {
  String? equals;

  String? doesNotEqual;

  String? contains;

  String? doesNotContain;

  String? startsWith;

  String? endsWith;

  bool? isEmpty;

  bool? isNotEmpty;

  Notion? notion;

  TextFilterCondition({
    this.equals,
    this.doesNotEqual,
    this.contains,
    this.doesNotContain,
    this.startsWith,
    this.endsWith,
    this.isEmpty,
    this.isNotEmpty,
  });

  factory TextFilterCondition.fromJson(Map<String, dynamic> json) {
    return TextFilterCondition(
      equals: as<String?>(json['equals']),
      doesNotEqual: as<String?>(json['does_not_equal']),
      contains: as<String?>(json['contains']),
      doesNotContain: as<String?>(json['does_not_contain']),
      startsWith: as<String?>(json['starts_with']),
      endsWith: as<String?>(json['ends_with']),
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(equals != null) jsonData['equals'] = equals;
    if(doesNotEqual != null) jsonData['does_not_equal'] = doesNotEqual;
    if(contains != null) jsonData['contains'] = contains;
    if(doesNotContain != null) jsonData['does_not_contain'] = doesNotContain;
    if(startsWith != null) jsonData['starts_with'] = startsWith;
    if(endsWith != null) jsonData['ends_with'] = endsWith;
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    return jsonData;
  }

  TextFilterCondition copy() => TextFilterCondition.fromJson(toJson());
}
