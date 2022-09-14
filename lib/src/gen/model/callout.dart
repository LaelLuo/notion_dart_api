import './block.dart';
import './emoji.dart';
import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Callout {
  List<RichText>? richText;

  String? color;

  List<Block>? children;

  Emoji? icon;

  Notion? notion;

  Callout({
    this.richText,
    this.color,
    this.children,
    this.icon,
  });

  factory Callout.fromJson(Map<String, dynamic> json) {
    return Callout(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      color: as<String?>(json['color']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
      icon: json['icon'] == null ? null : Emoji.fromJson(json['icon']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(color != null) jsonData['color'] = color;
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    if(icon != null) jsonData['icon'] = icon?.toJson();
    return jsonData;
  }

  Callout copy() => Callout.fromJson(toJson());
}
