import 'package:TodoApp/models/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> getCategories();

  Future<void> addTask(Task task);

  Future<void> deleteTask(Task task);

  Future<void> updateTask(Task task);
}
