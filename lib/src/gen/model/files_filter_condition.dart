import 'common.dart';
import '../../notion.dart';

class FilesFilterCondition {
  bool? isEmpty;

  bool? isNotEmpty;

  Notion? notion;

  FilesFilterCondition({
    this.isEmpty,
    this.isNotEmpty,
  });

  factory FilesFilterCondition.fromJson(Map<String, dynamic> json) {
    return FilesFilterCondition(
      isEmpty: as<bool?>(json['is_empty']),
      isNotEmpty: as<bool?>(json['is_not_empty']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(isEmpty != null) jsonData['is_empty'] = isEmpty;
    if(isNotEmpty != null) jsonData['is_not_empty'] = isNotEmpty;
    return jsonData;
  }

  FilesFilterCondition copy() => FilesFilterCondition.fromJson(toJson());
}
