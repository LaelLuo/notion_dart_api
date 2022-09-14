import 'common.dart';
import '../../notion.dart';

class Annotations {
  bool? bold;

  bool? italic;

  bool? strikethrough;

  bool? underline;

  bool? code;

  String? color;

  Notion? notion;

  Annotations({
    this.bold,
    this.italic,
    this.strikethrough,
    this.underline,
    this.code,
    this.color,
  });

  factory Annotations.fromJson(Map<String, dynamic> json) {
    return Annotations(
      bold: as<bool?>(json['bold']),
      italic: as<bool?>(json['italic']),
      strikethrough: as<bool?>(json['strikethrough']),
      underline: as<bool?>(json['underline']),
      code: as<bool?>(json['code']),
      color: as<String?>(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(bold != null) jsonData['bold'] = bold;
    if(italic != null) jsonData['italic'] = italic;
    if(strikethrough != null) jsonData['strikethrough'] = strikethrough;
    if(underline != null) jsonData['underline'] = underline;
    if(code != null) jsonData['code'] = code;
    if(color != null) jsonData['color'] = color;
    return jsonData;
  }

  Annotations copy() => Annotations.fromJson(toJson());
}
