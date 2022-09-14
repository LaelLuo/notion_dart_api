import 'common.dart';
import '../../notion.dart';

class Color {
  String? color;

  Notion? notion;

  Color({
    this.color,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      color: as<String?>(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(color != null) jsonData['color'] = color;
    return jsonData;
  }

  Color copy() => Color.fromJson(toJson());
}
