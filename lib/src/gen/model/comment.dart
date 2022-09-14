import './parent.dart';
import './rich_text.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Comment {
  String? object;

  String? id;

  Parent? parent;

  String? discussionId;

  String? createdTime;

  String? lastEditedTime;

  User? createdBy;

  List<RichText>? richText;

  Notion? notion;

  Comment({
    this.object,
    this.id,
    this.parent,
    this.discussionId,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.richText,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      object: as<String?>(json['object']),
      id: as<String?>(json['id']),
      parent: json['parent'] == null ? null : Parent.fromJson(json['parent']),
      discussionId: as<String?>(json['discussion_id']),
      createdTime: as<String?>(json['created_time']),
      lastEditedTime: as<String?>(json['last_edited_time']),
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by']),
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(object != null) jsonData['object'] = object;
    if(id != null) jsonData['id'] = id;
    if(parent != null) jsonData['parent'] = parent?.toJson();
    if(discussionId != null) jsonData['discussion_id'] = discussionId;
    if(createdTime != null) jsonData['created_time'] = createdTime;
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime;
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Comment copy() => Comment.fromJson(toJson());
}
