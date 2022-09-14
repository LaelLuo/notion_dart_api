import 'common.dart';
import '../../notion.dart';

class Text {
  String? content;

  String? link;

  Notion? notion;

  Text({
    this.content,
    this.link,
  });

  factory Text.fromJson(Map<String, dynamic> json) {
    return Text(
      content: as<String?>(json['content']),
      link: as<String?>(json['link']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(content != null) jsonData['content'] = content;
    if(link != null) jsonData['link'] = link;
    return jsonData;
  }

  Text copy() => Text.fromJson(toJson());
}
