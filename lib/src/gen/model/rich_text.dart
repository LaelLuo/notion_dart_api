import './annotations.dart';
import './equation.dart';
import './mention.dart';
import './text.dart';
import 'common.dart';
import '../../notion.dart';

class RichText {
  String? type;

  Annotations? annotations;

  String? plainText;

  String? href;

  Text? text;

  Mention? mention;

  Equation? equation;

  Notion? notion;

  RichText({
    this.type,
    this.annotations,
    this.plainText,
    this.href,
    this.text,
    this.mention,
    this.equation,
  });

  factory RichText.fromJson(Map<String, dynamic> json) {
    return RichText(
      type: as<String?>(json['type']),
      annotations: json['annotations'] == null ? null : Annotations.fromJson(json['annotations']),
      plainText: as<String?>(json['plain_text']),
      href: as<String?>(json['href']),
      text: json['text'] == null ? null : Text.fromJson(json['text']),
      mention: json['mention'] == null ? null : Mention.fromJson(json['mention']),
      equation: json['equation'] == null ? null : Equation.fromJson(json['equation']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(annotations != null) jsonData['annotations'] = annotations?.toJson();
    if(plainText != null) jsonData['plain_text'] = plainText;
    if(href != null) jsonData['href'] = href;
    if(text != null) jsonData['text'] = text?.toJson();
    if(mention != null) jsonData['mention'] = mention?.toJson();
    if(equation != null) jsonData['equation'] = equation?.toJson();
    return jsonData;
  }

  RichText copy() => RichText.fromJson(toJson());
}
