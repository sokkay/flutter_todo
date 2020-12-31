import 'package:TodoApp/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension CategoryFirebaseEntity on Category {
  static Category fromSnapshot(DocumentSnapshot snap) {
    final dataMap = snap.data();
    dataMap.putIfAbsent('id', () => snap.id);
    return Category.fromMap(dataMap);
  }

  Map<String, Object> toDocument() {
    final map = this.toMap();
    map.removeWhere((key, value) => key == 'id');
    return map;
    // return Map.fromIterable(
    //     this.toMap().entries.where((entrie) => entrie.key != 'id'),
    //     key: (entry) => (entry as MapEntry).key,
    //     value: (entry) => (entry as MapEntry).value);
  }
}
