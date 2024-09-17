/*
  class Todo {
    Todo({
      required this.description,
      this.completed = false,
    });

    factory Todo.fromJson(Map<String, dynamic> json) {
      return Todo(
        description: json['description'] as String,
        completed: json['completed'] as bool,
      );
    }

    final String description;
    final bool completed;
  } 
*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String description,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
