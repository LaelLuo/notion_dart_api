import 'common.dart';
import '../../notion.dart';

class CheckboxFilterCondition {
  bool? equals;

  bool? doesNotEqual;

  Notion? notion;

  CheckboxFilterCondition({
    this.equals,
    this.doesNotEqual,
  });

  factory CheckboxFilterCondition.fromJson(Map<String, dynamic> json) {
    return CheckboxFilterCondition(
      equals: as<bool?>(json['equals']),
      doesNotEqual: as<bool?>(json['does_not_equal']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(equals != null) jsonData['equals'] = equals;
    if(doesNotEqual != null) jsonData['does_not_equal'] = doesNotEqual;
    return jsonData;
  }

  CheckboxFilterCondition copy() => CheckboxFilterCondition.fromJson(toJson());
}
