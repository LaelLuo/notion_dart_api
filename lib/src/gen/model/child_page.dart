import 'common.dart';
import '../../notion.dart';

class ChildPage {
  String? title;

  Notion? notion;

  ChildPage({
    this.title,
  });

  factory ChildPage.fromJson(Map<String, dynamic> json) {
    return ChildPage(
      title: as<String?>(json['title']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(title != null) jsonData['title'] = title;
    return jsonData;
  }

  ChildPage copy() => ChildPage.fromJson(toJson());
}
