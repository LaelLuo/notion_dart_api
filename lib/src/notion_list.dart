
import 'gen/model/common.dart';
import 'gen/model/index.dart';
import 'typedef.dart';

class NotionList<T> {
  final String object;
  final String? id;
  final String? nextCusor;
  final bool hasMore;
  final List<T> results;

  NotionList(this.object, this.id, this.nextCusor, this.hasMore, this.results);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'object': object,
      'id': id,
      'next_cusor': nextCusor,
      'has_more': hasMore,
      'results': results.map((dynamic x) => x.toMap()).toList(),
    };
  }

  factory NotionList.fromJson(Map<String, dynamic> map) {
    return NotionList<T>(
      map['object'] as String,
      map['id'] != null ? map['id'] as String : null,
      map['next_cusor'] != null ? map['next_cusor'] as String : null,
      map['has_more'] as bool,
      map['results'] == null
          ? []
          : List<T>.from(
              (map['results'] as JsonList).map<T>(
                (x) {
                  if (T == Page) {
                    return Page.fromJson(x) as T;
                  } else if (T == Database) {
                    return Database.fromJson(x) as T;
                  } else if (T == Block) {
                    return Block.fromJson(x) as T;
                  }
                  return as<T>(x);
                },
              ),
            ),
    );
  }
}
