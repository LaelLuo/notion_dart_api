import './select_option.dart';
import './status_groups.dart';
import '../../notion.dart';

class Status {
  List<SelectOption>? options;

  List<StatusGroups>? groups;

  Notion? notion;

  Status({
    this.options,
    this.groups,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      options: (json['options'] as List?)?.map((item) => SelectOption.fromJson(item)).toList(),
      groups: (json['groups'] as List?)?.map((item) => StatusGroups.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(options != null) jsonData['options'] = options?.map((v) => v.toJson()).toList();
    if(groups != null) jsonData['groups'] = groups?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Status copy() => Status.fromJson(toJson());
}
