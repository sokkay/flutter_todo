import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:TodoApp/models/task.dart';

export 'package:TodoApp/extension/category_firabase_entity.dart';

@immutable
class Category {
  final String id;
  final String name;
  final int color;
  final List<Task> tasks;

  Category({
    this.id,
    this.name,
    int color,
    this.tasks = const [],
  }) : this.color = color ?? Colors.grey.value;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'tasks': tasks?.map((x) => x?.toMap())?.toList(),
    };
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category &&
        o.id == id &&
        o.name == name &&
        listEquals(o.tasks, tasks);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tasks.hashCode;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, color: $color, tasks: $tasks)';
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  Category copyWith({
    String id,
    String name,
    int color,
    List<Task> tasks,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      tasks: tasks ?? this.tasks,
    );
  }
}
