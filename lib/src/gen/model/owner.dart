import './user.dart';
import 'common.dart';
import '../../notion.dart';

class Owner {
  String? type;

  bool? workspace;

  User? user;

  Notion? notion;

  Owner({
    this.type,
    this.workspace,
    this.user,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      type: as<String?>(json['type']),
      workspace: as<bool?>(json['workspace']),
      user: json['user'] == null ? null : User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(type != null) jsonData['type'] = type;
    if(workspace != null) jsonData['workspace'] = workspace;
    if(user != null) jsonData['user'] = user?.toJson();
    return jsonData;
  }

  Owner copy() => Owner.fromJson(toJson());
}
