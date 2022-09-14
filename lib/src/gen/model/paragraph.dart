import './block.dart';
import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Paragraph {
  List<RichText>? richText;

  String? color;

  List<Block>? children;

  Notion? notion;

  Paragraph({
    this.richText,
    this.color,
    this.children,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) {
    return Paragraph(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      color: as<String?>(json['color']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(color != null) jsonData['color'] = color;
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Paragraph copy() => Paragraph.fromJson(toJson());
}
