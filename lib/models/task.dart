import 'dart:convert';

import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final String details;
  final bool complete;
  final DateTime date;
  final List<DateTime> repetitions;

  Task({
    this.id,
    this.title,
    this.details,
    this.complete,
    this.date,
    this.repetitions,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Task &&
        o.id == id &&
        o.title == title &&
        o.details == details &&
        o.complete == complete &&
        o.date == date &&
        listEquals(o.repetitions, repetitions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        details.hashCode ^
        complete.hashCode ^
        date.hashCode ^
        repetitions.hashCode;
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, details: $details, complete: $complete, date: $date, repetitions: $repetitions)';
  }
}
