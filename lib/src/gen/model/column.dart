import './block.dart';
import '../../notion.dart';

class Column {
  List<Block>? children;

  Notion? notion;

  Column({
    this.children,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Column copy() => Column.fromJson(toJson());
}
