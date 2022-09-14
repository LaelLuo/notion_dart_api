import 'common.dart';
import '../../notion.dart';

class LinkPreview {
  String? url;

  Notion? notion;

  LinkPreview({
    this.url,
  });

  factory LinkPreview.fromJson(Map<String, dynamic> json) {
    return LinkPreview(
      url: as<String?>(json['url']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(url != null) jsonData['url'] = url;
    return jsonData;
  }

  LinkPreview copy() => LinkPreview.fromJson(toJson());
}
