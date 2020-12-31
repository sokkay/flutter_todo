import 'package:TodoApp/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension TaskFirebaseEntity on Task {
  static Task fromSnapshot(DocumentSnapshot snap) {
    final dataMap = snap.data();
    dataMap.putIfAbsent('id', () => snap.id);
    return Task.fromMap(dataMap);
  }

  Map<String, Object> toDocument() {
    final map = this.toMap();
    map.removeWhere((key, value) => key == 'id');
    return map;
  }
}
