import './rich_text.dart';
import 'common.dart';
import '../../notion.dart';

class Code {
  List<RichText>? richText;

  List<RichText>? caption;

  String? language;

  Notion? notion;

  Code({
    this.richText,
    this.caption,
    this.language,
  });

  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      caption: (json['caption'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      language: as<String?>(json['language']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(caption != null) jsonData['caption'] = caption?.map((v) => v.toJson()).toList();
    if(language != null) jsonData['language'] = language;
    return jsonData;
  }

  Code copy() => Code.fromJson(toJson());
}
