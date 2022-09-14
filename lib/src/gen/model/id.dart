import 'common.dart';
import '../../notion.dart';

class Id {
  String? id;

  Notion? notion;

  Id({
    this.id,
  });

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      id: as<String?>(json['id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(id != null) jsonData['id'] = id;
    return jsonData;
  }

  Id copy() => Id.fromJson(toJson());
}
