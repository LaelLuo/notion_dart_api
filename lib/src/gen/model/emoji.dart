import 'common.dart';
import '../../notion.dart';

class Emoji {
  String? type;

  String? emoji;

  Notion? notion;

  Emoji({
    this.type,
    this.emoji,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      type: as<String?>(json['type']),
      emoji: as<String?>(json['emoji']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(emoji != null) jsonData['emoji'] = emoji;
    return jsonData;
  }

  Emoji copy() => Emoji.fromJson(toJson());
}
