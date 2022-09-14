import 'common.dart';
import '../../notion.dart';

class PeopleFilterCondition {
  String? contains;

  String? doesNotContain;

  bool? isEmpty;

  bool? isNotEmpty;

  Notion? notion;

  PeopleFilterCondition({
    this.contains,
    this.doesNotContain,
    this.isEmpty,
    this.isNotEmpty,
  });

  factory PeopleFilterCondition.fromJson(Map<String, dynamic> json) {
    return PeopleFilterCondition(
      contains: as<String?>(json['contains']),
      doesNotContain: as<String?>(json['does_not_contain']),
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(contains != null) jsonData['contains'] = contains;
    if(doesNotContain != null) jsonData['does_not_contain'] = doesNotContain;
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    return jsonData;
  }

  PeopleFilterCondition copy() => PeopleFilterCondition.fromJson(toJson());
}
