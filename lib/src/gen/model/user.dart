import './owner.dart';
import './person.dart';
import 'common.dart';
import '../../notion.dart';

class User {
  String? object;

  String? id;

  String? name;

  String? avatarUrl;

  String? type;

  Person? person;

  Owner? bot;

  Notion? notion;

  User({
    this.object,
    this.id,
    this.name,
    this.avatarUrl,
    this.type,
    this.person,
    this.bot,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      object: as<String?>(json['object']),
      id: as<String?>(json['id']),
      name: as<String?>(json['name']),
      avatarUrl: as<String?>(json['avatar_url']),
      type: as<String?>(json['type']),
      person: json['person'] == null ? null : Person.fromJson(json['person']),
      bot: json['bot'] == null ? null : Owner.fromJson(json['bot']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(object != null) jsonData['object'] = object;
    if(id != null) jsonData['id'] = id;
    if(name != null) jsonData['name'] = name;
    if(avatarUrl != null) jsonData['avatar_url'] = avatarUrl;
    if(type != null) jsonData['type'] = type;
    if(person != null) jsonData['person'] = person?.toJson();
    if(bot != null) jsonData['bot'] = bot?.toJson();
    return jsonData;
  }

  User copy() => User.fromJson(toJson());
}
