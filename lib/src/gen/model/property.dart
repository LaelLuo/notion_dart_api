import './formula.dart';
import './relation.dart';
import './rollup.dart';
import './select.dart';
import 'common.dart';
import '../../notion.dart';

class Property {
  String? id;

  String? type;

  String? name;

  String? format;

  Select? select;

  String? status;

  Select? multiSelect;

  Formula? formula;

  Relation? relation;

  Rollup? rollup;

  Notion? notion;

  Property({
    this.id,
    this.type,
    this.name,
    this.format,
    this.select,
    this.status,
    this.multiSelect,
    this.formula,
    this.relation,
    this.rollup,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: as<String?>(json['id']),
      type: as<String?>(json['type']),
      name: as<String?>(json['name']),
      format: as<String?>(json['format']),
      select: json['select'] == null ? null : Select.fromJson(json['select']),
      status: as<String?>(json['status']),
      multiSelect: json['multi_select'] == null ? null : Select.fromJson(json['multi_select']),
      formula: json['formula'] == null ? null : Formula.fromJson(json['formula']),
      relation: json['relation'] == null ? null : Relation.fromJson(json['relation']),
      rollup: json['rollup'] == null ? null : Rollup.fromJson(json['rollup']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(id != null) jsonData['id'] = id;
    if(type != null) jsonData['type'] = type;
    if(name != null) jsonData['name'] = name;
    if(format != null) jsonData['format'] = format;
    if(select != null) jsonData['select'] = select?.toJson();
    if(status != null) jsonData['status'] = status;
    if(multiSelect != null) jsonData['multi_select'] = multiSelect?.toJson();
    if(formula != null) jsonData['formula'] = formula?.toJson();
    if(relation != null) jsonData['relation'] = relation?.toJson();
    if(rollup != null) jsonData['rollup'] = rollup?.toJson();
    return jsonData;
  }

  Property copy() => Property.fromJson(toJson());
}
