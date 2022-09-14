import './block.dart';
import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Todo {
  List<RichText>? richText;

  String? color;

  List<Block>? children;

  bool? checked;

  Notion? notion;

  Todo({
    this.richText,
    this.color,
    this.children,
    this.checked,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      color: as<String?>(json['color']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
      checked: as<bool?>(json['checked']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(color != null) jsonData['color'] = color;
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    if(checked != null) jsonData['checked'] = checked;
    return jsonData;
  }

  Todo copy() => Todo.fromJson(toJson());
}
