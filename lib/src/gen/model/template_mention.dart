import 'common.dart';
import '../../notion.dart';

class TemplateMention {
  String? type ;

  String? templateMentionDate;

  String? templateMentionUser;

  Notion? notion;

  TemplateMention({
    this.type ,
    this.templateMentionDate,
    this.templateMentionUser,
  });

  factory TemplateMention.fromJson(Map<String, dynamic> json) {
    return TemplateMention(
      type : as<String?>(json['type ']),
      templateMentionDate: as<String?>(json['template_mention_date']),
      templateMentionUser: as<String?>(json['template_mention_user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type  != null) jsonData['type '] = type ;
    if(templateMentionDate != null) jsonData['template_mention_date'] = templateMentionDate;
    if(templateMentionUser != null) jsonData['template_mention_user'] = templateMentionUser;
    return jsonData;
  }

  TemplateMention copy() => TemplateMention.fromJson(toJson());
}
