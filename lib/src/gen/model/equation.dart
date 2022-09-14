import 'common.dart';
import '../../notion.dart';

class Equation {
  String? expression;

  Notion? notion;

  Equation({
    this.expression,
  });

  factory Equation.fromJson(Map<String, dynamic> json) {
    return Equation(
      expression: as<String?>(json['expression']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(expression != null) jsonData['expression'] = expression;
    return jsonData;
  }

  Equation copy() => Equation.fromJson(toJson());
}
