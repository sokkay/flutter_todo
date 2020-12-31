import 'package:TodoApp/models/task.dart';
import 'package:TodoApp/repositories/task_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTaskRepository implements TaskRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get categories => _firestore.collection('categories');

  @override
  Future<void> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(Task task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Stream<List<Task>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
