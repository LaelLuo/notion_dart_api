import './select_option.dart';
import '../../notion.dart';

class Select {
  List<SelectOption>? options;

  Notion? notion;

  Select({
    this.options,
  });

  factory Select.fromJson(Map<String, dynamic> json) {
    return Select(
      options: (json['options'] as List?)?.map((item) => SelectOption.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(options != null) jsonData['options'] = options?.map((v) => v.toJson()).toList();
    return jsonData;
  }

  Select copy() => Select.fromJson(toJson());
}
