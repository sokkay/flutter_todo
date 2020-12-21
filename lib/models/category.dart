import 'dart:convert';

import 'package:TodoApp/models/task.dart';

class Category {
  final String id;
  final String name;
  final List<Task> tasks;
  Category({
    this.id,
    this.name,
    this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id'],
      name: map['name'],
      tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, name: $name, tasks: $tasks)';
}
