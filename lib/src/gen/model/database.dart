import './emoji.dart';
import './notion_file.dart';
import './parent.dart';
import './properties.dart';
import './rich_text.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Database {
  String? object;

  String? id;

  NotionFile? cover;

  Emoji? icon;

  String? createdTime;

  User? createdBy;

  User? lastEditedBy;

  String? lastEditedTime;

  List<RichText>? title;

  Properties? properties;

  Parent? parent;

  String? url;

  bool? archived;

  bool? isInline;

  Notion? notion;

  Database({
    this.object,
    this.id,
    this.cover,
    this.icon,
    this.createdTime,
    this.createdBy,
    this.lastEditedBy,
    this.lastEditedTime,
    this.title,
    this.properties,
    this.parent,
    this.url,
    this.archived,
    this.isInline,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      object: as<String?>(json['object']),
      id: as<String?>(json['id']),
      cover: json['cover'] == null ? null : NotionFile.fromJson(json['cover']),
      icon: json['icon'] == null ? null : Emoji.fromJson(json['icon']),
      createdTime: as<String?>(json['created_time']),
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by']),
      lastEditedBy: json['last_edited_by'] == null ? null : User.fromJson(json['last_edited_by']),
      lastEditedTime: as<String?>(json['last_edited_time']),
      title: (json['title'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      properties: json['properties'] == null ? null : Properties.fromJson(json['properties']),
      parent: json['parent'] == null ? null : Parent.fromJson(json['parent']),
      url: as<String?>(json['url']),
      archived: as<bool?>(json['archived']),
      isInline: as<bool?>(json['is_inline']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(object != null) jsonData['object'] = object;
    if(id != null) jsonData['id'] = id;
    if(cover != null) jsonData['cover'] = cover?.toJson();
    if(icon != null) jsonData['icon'] = icon?.toJson();
    if(createdTime != null) jsonData['created_time'] = createdTime;
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(lastEditedBy != null) jsonData['last_edited_by'] = lastEditedBy?.toJson();
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime;
    if(title != null) jsonData['title'] = title?.map((v) => v.toJson()).toList();
    if(properties != null) jsonData['properties'] = properties?.toJson();
    if(parent != null) jsonData['parent'] = parent?.toJson();
    if(url != null) jsonData['url'] = url;
    if(archived != null) jsonData['archived'] = archived;
    if(isInline != null) jsonData['is_inline'] = isInline;
    return jsonData;
  }

  Database copy() => Database.fromJson(toJson());
}
