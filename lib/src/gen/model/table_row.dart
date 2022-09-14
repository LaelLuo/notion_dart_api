import './rich_text.dart';
import '../../notion.dart';

class TableRow {
  List<RichText>? cells;

  Notion? notion;

  TableRow({
    this.cells,
  });

  factory TableRow.fromJson(Map<String, dynamic> json) {
    return TableRow(
      cells: (json['cells'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(cells != null) jsonData['cells'] = cells?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  TableRow copy() => TableRow.fromJson(toJson());
}
