import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Bookmark {
  String? url;

  List<RichText>? caption;

  Notion? notion;

  Bookmark({
    this.url,
    this.caption,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      url: as<String?>(json['url']),
      caption: (json['caption'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(url != null) jsonData['url'] = url;
    if(caption != null) jsonData['caption'] = caption?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Bookmark copy() => Bookmark.fromJson(toJson());
}
