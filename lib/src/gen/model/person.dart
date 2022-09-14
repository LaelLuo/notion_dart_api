import 'common.dart';
import '../../notion.dart';

class Person {
  String? email;

  Notion? notion;

  Person({
    this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      email: as<String?>(json['email']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if(email != null) jsonData['email'] = email;
    return jsonData;
  }

  Person copy() => Person.fromJson(toJson());
}
