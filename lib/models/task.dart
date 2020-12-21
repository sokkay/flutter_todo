import 'dart:convert';

import 'package:TodoApp/models/category.dart';

class Task {
  final String id;
  final String title;
  final String details;
  final bool complete;
  final DateTime date;
  final List<DateTime> repetitions;
  final Category category;

  Task({
    this.id,
    this.title,
    this.details,
    this.complete,
    this.date,
    this.repetitions,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'details': details,
      'complete': complete,
      'date': date?.millisecondsSinceEpoch,
      'repetitions':
          repetitions?.map((x) => x?.millisecondsSinceEpoch)?.toList(),
      'category': category?.toMap(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Task(
      id: map['id'],
      title: map['title'],
      details: map['details'],
      complete: map['complete'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      repetitions: List<DateTime>.from(map['repetitions']
          ?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))),
      category: Category.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, details: $details, complete: $complete, date: $date, repetitions: $repetitions, category: $category)';
  }
}
