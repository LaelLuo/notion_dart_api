import './date.dart';
import './formula_value.dart';
import './id.dart';
import './notion_file.dart';
import './rich_text.dart';
import './select_option.dart';
import './user.dart';
import 'common.dart';
import '../../notion.dart';

class PropertyValue {
  String? id;

  String? type;

  List<RichText>? title;

  List<RichText>? richText;

  double? number;

  SelectOption? select;

  SelectOption? status;

  List<SelectOption>? multiSelect;

  Date? date;

  FormulaValue? formula;

  List<Id>? relation;

  List<User>? people;

  List<NotionFile>? files;

  bool? checkbox;

  String? url;

  String? email;

  String? phoneNumber;

  String? createdTime;

  User? createdBy;

  String? lastEditedTime;

  User? lastEditedBy;

  String? object;

  Notion? notion;

  PropertyValue({
    this.id,
    this.type,
    this.title,
    this.richText,
    this.number,
    this.select,
    this.status,
    this.multiSelect,
    this.date,
    this.formula,
    this.relation,
    this.people,
    this.files,
    this.checkbox,
    this.url,
    this.email,
    this.phoneNumber,
    this.createdTime,
    this.createdBy,
    this.lastEditedTime,
    this.lastEditedBy,
    this.object,
  });

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return PropertyValue(
      id: as<String?>(json['id']),
      type: as<String?>(json['type']),
      title: (json['title'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      richText: (json['rich_text'] as List?)?.map((item) => RichText.fromJson(item)).toList(),
      number: as<double?>(json['number']),
      select: json['select'] == null ? null : SelectOption.fromJson(json['select']),
      status: json['status'] == null ? null : SelectOption.fromJson(json['status']),
      multiSelect: (json['multi_select'] as List?)?.map((item) => SelectOption.fromJson(item)).toList(),
      date: json['date'] == null ? null : Date.fromJson(json['date']),
      formula: json['formula'] == null ? null : FormulaValue.fromJson(json['formula']),
      relation: (json['relation'] as List?)?.map((item) => Id.fromJson(item)).toList(),
      people: (json['people'] as List?)?.map((item) => User.fromJson(item)).toList(),
      files: (json['files'] as List?)?.map((item) => NotionFile.fromJson(item)).toList(),
      checkbox: as<bool?>(json['checkbox']),
      url: as<String?>(json['url']),
      email: as<String?>(json['email']),
      phoneNumber: as<String?>(json['phone_number']),
      createdTime: as<String?>(json['created_time']),
      createdBy: json['created_by'] == null ? null : User.fromJson(json['created_by']),
      lastEditedTime: as<String?>(json['last_edited_time']),
      lastEditedBy: json['last_edited_by'] == null ? null : User.fromJson(json['last_edited_by']),
      object: as<String?>(json['object']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(id != null) jsonData['id'] = id;
    if(type != null) jsonData['type'] = type;
    if(title != null) jsonData['title'] = title?.map((v) => v.toJson()).toList();
    if(richText != null) jsonData['rich_text'] = richText?.map((v) => v.toJson()).toList();
    if(number != null) jsonData['number'] = number;
    if(select != null) jsonData['select'] = select?.toJson();
    if(status != null) jsonData['status'] = status?.toJson();
    if(multiSelect != null) jsonData['multi_select'] = multiSelect?.map((v) => v.toJson()).toList();
    if(date != null) jsonData['date'] = date?.toJson();
    if(formula != null) jsonData['formula'] = formula?.toJson();
    if(relation != null) jsonData['relation'] = relation?.map((v) => v.toJson()).toList();
    if(people != null) jsonData['people'] = people?.map((v) => v.toJson()).toList();
    if(files != null) jsonData['files'] = files?.map((v) => v.toJson()).toList();
    if(checkbox != null) jsonData['checkbox'] = checkbox;
    if(url != null) jsonData['url'] = url;
    if(email != null) jsonData['email'] = email;
    if(phoneNumber != null) jsonData['phone_number'] = phoneNumber;
    if(createdTime != null) jsonData['created_time'] = createdTime;
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime;
    if(lastEditedBy != null) jsonData['last_edited_by'] = lastEditedBy?.toJson();
    if(object != null) jsonData['object'] = object;
    return jsonData;
  }

  PropertyValue copy() => PropertyValue.fromJson(toJson());
}
