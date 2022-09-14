import './block.dart';
import './emoji.dart';
import './notion_file.dart';
import './parent.dart';
import './properties_value.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Page {
  String? object;

  String? id;

  String? createdTime;

  String? lastEditedTime;

  User? createdBy;

  User? lastEditedBy;

  NotionFile? cover;

  Emoji? icon;

  Parent? parent;

  bool? archived;

  PropertiesValue? properties;

  String? url;

  List<Block>? children;

  Notion? notion;

  Page({
    this.object,
    this.id,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.cover,
    this.icon,
    this.parent,
    this.archived,
    this.properties,
    this.url,
    this.children,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      object: as<String?>(json['object']),
      id: as<String?>(json['id']),
      createdTime: as<String?>(json['created_time']),
      lastEditedTime: as<String?>(json['last_edited_time']),
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by']),
      lastEditedBy: json['last_edited_by'] == null ? null : User.fromJson(json['last_edited_by']),
      cover: json['cover'] == null ? null : NotionFile.fromJson(json['cover']),
      icon: json['icon'] == null ? null : Emoji.fromJson(json['icon']),
      parent: json['parent'] == null ? null : Parent.fromJson(json['parent']),
      archived: as<bool?>(json['archived']),
      properties: json['properties'] == null ? null : PropertiesValue.fromJson(json['properties']),
      url: as<String?>(json['url']),
      children: (json['children'] as List?)?.map((item) => Block.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(object != null) jsonData['object'] = object;
    if(id != null) jsonData['id'] = id;
    if(createdTime != null) jsonData['created_time'] = createdTime;
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime;
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(lastEditedBy != null) jsonData['last_edited_by'] = lastEditedBy?.toJson();
    if(cover != null) jsonData['cover'] = cover?.toJson();
    if(icon != null) jsonData['icon'] = icon?.toJson();
    if(parent != null) jsonData['parent'] = parent?.toJson();
    if(archived != null) jsonData['archived'] = archived;
    if(properties != null) jsonData['properties'] = properties?.toJson();
    if(url != null) jsonData['url'] = url;
    if(children != null) jsonData['children'] = children?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Page copy() => Page.fromJson(toJson());
}
