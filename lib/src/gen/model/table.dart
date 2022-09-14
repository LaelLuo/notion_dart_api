import './block.dart';
import 'common.dart';
import '../../notion.dart';

class Table {
  int? tableWidth;

  bool? hasColumnHeader;

  bool? hasRowHeader;

  List<Block>? children;

  Notion? notion;

  Table({
    this.tableWidth,
    this.hasColumnHeader,
    this.hasRowHeader,
    this.children,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      tableWidth: as<int?>(json['table_width']),
      hasColumnHeader: as<bool?>(json['has_column_header']),
      hasRowHeader: as<bool?>(json['has_row_header']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(tableWidth != null) jsonData['table_width'] = tableWidth;
    if(hasColumnHeader != null) jsonData['has_column_header'] = hasColumnHeader;
    if(hasRowHeader != null) jsonData['has_row_header'] = hasRowHeader;
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Table copy() => Table.fromJson(toJson());
}
