import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Heading {
  List<RichText>? richText;

  String? color;

  bool? isToggleable;

  Notion? notion;

  Heading({
    this.richText,
    this.color,
    this.isToggleable,
  });

  factory Heading.fromJson(Map<String, dynamic> json) {
    return Heading(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      color: as<String?>(json['color']),
      isToggleable: as<bool?>(json['is_toggleable']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(color != null) jsonData['color'] = color;
    if(isToggleable != null) jsonData['is_toggleable'] = isToggleable;
    return jsonData;
  }

  Heading copy() => Heading.fromJson(toJson());
}
