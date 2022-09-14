import './date.dart';
import './link_preview.dart';
import './reference.dart';
import './template_mention.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Mention {
  String? type;

  User? user;

  Reference? page;

  Reference? database;

  Date? date;

  TemplateMention? templateMention;

  LinkPreview? linkPreview;

  Notion? notion;

  Mention({
    this.type,
    this.user,
    this.page,
    this.database,
    this.date,
    this.templateMention,
    this.linkPreview,
  });

  factory Mention.fromJson(Map<String, dynamic> json) {
    return Mention(
      type: as<String?>(json['type']),
      user: json['user'] == null ? null : User.fromJson(json['user']),
      page: json['page'] == null ? null : Reference.fromJson(json['page']),
      database: json['database'] == null ? null : Reference.fromJson(json['database']),
      date: json['date'] == null ? null : Date.fromJson(json['date']),
      templateMention: json['template_mention'] == null ? null : TemplateMention.fromJson(json['template_mention']),
      linkPreview: json['link_preview'] == null ? null : LinkPreview.fromJson(json['link_preview']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(user != null) jsonData['user'] = user?.toJson();
    if(page != null) jsonData['page'] = page?.toJson();
    if(database != null) jsonData['database'] = database?.toJson();
    if(date != null) jsonData['date'] = date?.toJson();
    if(templateMention != null) jsonData['template_mention'] = templateMention?.toJson();
    if(linkPreview != null) jsonData['link_preview'] = linkPreview?.toJson();
    return jsonData;
  }

  Mention copy() => Mention.fromJson(toJson());
}
