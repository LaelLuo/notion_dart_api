import 'common.dart';
import '../../notion.dart';

class Formula {
  String? expression;

  Notion? notion;

  Formula({
    this.expression,
  });

  factory Formula.fromJson(Map<String, dynamic> json) {
    return Formula(
      expression: as<String?>(json['expression']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(expression != null) jsonData['expression'] = expression;
    return jsonData;
  }

  Formula copy() => Formula.fromJson(toJson());
}
