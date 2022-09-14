import 'common.dart';
import '../../notion.dart';

class NotionFile {
  String? type;

  String? url;

  String? expiryTime;

  String? name;

  Notion? notion;

  NotionFile({
    this.type,
    this.url,
    this.expiryTime,
    this.name,
  });

  factory NotionFile.fromJson(Map<String, dynamic> json) {
    return NotionFile(
      type: as<String?>(json['type']),
      url: as<String?>(json['url']),
      expiryTime: as<String?>(json['expiry_time']),
      name: as<String?>(json['name']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(url != null) jsonData['url'] = url;
    if(expiryTime != null) jsonData['expiry_time'] = expiryTime;
    if(name != null) jsonData['name'] = name;
    return jsonData;
  }

  NotionFile copy() => NotionFile.fromJson(toJson());
}
