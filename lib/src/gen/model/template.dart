import './block.dart';
import './rich_text.dart';
import '../../notion.dart';

class Template {
  List<RichText>? richText;

  List<Block>? children;

  Notion? notion;

  Template({
    this.richText,
    this.children,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Template copy() => Template.fromJson(toJson());
}
