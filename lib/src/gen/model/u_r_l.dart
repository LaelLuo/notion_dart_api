import 'common.dart';
import '../../notion.dart';

class URL {
  String? url;

  Notion? notion;

  URL({
    this.url,
  });

  factory URL.fromJson(Map<String, dynamic> json) {
    return URL(
      url: as<String?>(json['url']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(url != null) jsonData['url'] = url;
    return jsonData;
  }

  URL copy() => URL.fromJson(toJson());
}
