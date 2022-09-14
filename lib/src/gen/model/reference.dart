import 'common.dart';
import '../../notion.dart';

class Reference {
  String? id;

  Notion? notion;

  Reference({
    this.id,
  });

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(
      id: as<String?>(json['id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(id != null) jsonData['id'] = id;
    return jsonData;
  }

  Reference copy() => Reference.fromJson(toJson());
}
