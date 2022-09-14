import './checkbox_filter_condition.dart';
import './date_filter_condition.dart';
import './files_filter_condition.dart';
import './formula_filter_condition.dart';
import './number_filter_condition.dart';
import './people_filter_condition.dart';
import './rollup_filter_condition.dart';
import './select_filter_condition.dart';
import './text_filter_condition.dart';
import 'common.dart';
import '../../notion.dart';

class Filter {
  String? property;

  TextFilterCondition? title;

  TextFilterCondition? richText;

  TextFilterCondition? utl;

  TextFilterCondition? email;

  TextFilterCondition? phoneNumber;

  NumberFilterCondition? number;

  CheckboxFilterCondition? checkbox;

  SelectFilterCondition? select;

  SelectFilterCondition? multiSelect;

  SelectFilterCondition? status;

  DateFilterCondition? date;

  DateFilterCondition? createdTime;

  DateFilterCondition? lastEditedTime;

  PeopleFilterCondition? people;

  PeopleFilterCondition? createdBy;

  PeopleFilterCondition? lastEditedBy;

  FilesFilterCondition? files;

  PeopleFilterCondition? relation;

  RollupFilterCondition? rollup;

  FormulaFilterCondition? formula;

  List<Filter>? and;

  List<Filter>? or;

  Notion? notion;

  Filter({
    this.property,
    this.title,
    this.richText,
    this.utl,
    this.email,
    this.phoneNumber,
    this.number,
    this.checkbox,
    this.select,
    this.multiSelect,
    this.status,
    this.date,
    this.createdTime,
    this.lastEditedTime,
    this.people,
    this.createdBy,
    this.lastEditedBy,
    this.files,
    this.relation,
    this.rollup,
    this.formula,
    this.and,
    this.or,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      property: as<String?>(json['property']),
      title: json['title'] == null ? null : TextFilterCondition.fromJson(json['title']),
      richText: json['rich_text'] == null ? null : TextFilterCondition.fromJson(json['rich_text']),
      utl: json['utl'] == null ? null : TextFilterCondition.fromJson(json['utl']),
      email: json['email'] == null ? null : TextFilterCondition.fromJson(json['email']),
      phoneNumber: json['phone_number'] == null ? null : TextFilterCondition.fromJson(json['phone_number']),
      number: json['number'] == null ? null : NumberFilterCondition.fromJson(json['number']),
      checkbox: json['checkbox'] == null ? null : CheckboxFilterCondition.fromJson(json['checkbox']),
      select: json['select'] == null ? null : SelectFilterCondition.fromJson(json['select']),
      multiSelect: json['multi_select'] == null ? null : SelectFilterCondition.fromJson(json['multi_select']),
      status: json['status'] == null ? null : SelectFilterCondition.fromJson(json['status']),
      date: json['date'] == null ? null : DateFilterCondition.fromJson(json['date']),
      createdTime: json['created_time'] == null ? null : DateFilterCondition.fromJson(json['created_time']),
      lastEditedTime: json['last_edited_time'] == null ? null : DateFilterCondition.fromJson(json['last_edited_time']),
      people: json['people'] == null ? null : PeopleFilterCondition.fromJson(json['people']),
      createdBy: json['created_by'] == null ? null : PeopleFilterCondition.fromJson(json['created_by']),
      lastEditedBy: json['last_edited_by'] == null ? null : PeopleFilterCondition.fromJson(json['last_edited_by']),
      files: json['files'] == null ? null : FilesFilterCondition.fromJson(json['files']),
      relation: json['relation'] == null ? null : PeopleFilterCondition.fromJson(json['relation']),
      rollup: json['rollup'] == null ? null : RollupFilterCondition.fromJson(json['rollup']),
      formula: json['formula'] == null ? null : FormulaFilterCondition.fromJson(json['formula']),
      and: (json['and'] as List?)?.map((item) => Filter.fromJson(item)).toList(),
      or: (json['or'] as List?)?.map((item) => Filter.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(property != null) jsonData['property'] = property;
    if(title != null) jsonData['title'] = title?.toJson();
    if(richText != null) jsonData['rich_text'] = richText?.toJson();
    if(utl != null) jsonData['utl'] = utl?.toJson();
    if(email != null) jsonData['email'] = email?.toJson();
    if(phoneNumber != null) jsonData['phone_number'] = phoneNumber?.toJson();
    if(number != null) jsonData['number'] = number?.toJson();
    if(checkbox != null) jsonData['checkbox'] = checkbox?.toJson();
    if(select != null) jsonData['select'] = select?.toJson();
    if(multiSelect != null) jsonData['multi_select'] = multiSelect?.toJson();
    if(status != null) jsonData['status'] = status?.toJson();
    if(date != null) jsonData['date'] = date?.toJson();
    if(createdTime != null) jsonData['created_time'] = createdTime?.toJson();
    if(lastEditedTime != null) jsonData['last_edited_time'] = lastEditedTime?.toJson();
    if(people != null) jsonData['people'] = people?.toJson();
    if(createdBy != null) jsonData['created_by'] = createdBy?.toJson();
    if(lastEditedBy != null) jsonData['last_edited_by'] = lastEditedBy?.toJson();
    if(files != null) jsonData['files'] = files?.toJson();
    if(relation != null) jsonData['relation'] = relation?.toJson();
    if(rollup != null) jsonData['rollup'] = rollup?.toJson();
    if(formula != null) jsonData['formula'] = formula?.toJson();
    if(and != null) jsonData['and'] = and?.map((v) => v.toJson()).toList();
    if(or != null) jsonData['or'] = or?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Filter copy() => Filter.fromJson(toJson());
}
