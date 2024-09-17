/*
  final todoListProvider = FutureProvider.autoDispose<List<Todo>>((ref) async {
    // Simulate a network request. This would normally come from a real API
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  });
*/

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_integration/models/todo/todo.dart';

part 'todo_provider.g.dart';

//Functional way of creating a provider
//Can’t perform side-effects using public methods
@riverpod
Future<List<Todo>> todo(TodosRef ref) async {
  // Simulate a network request. This would normally come from a real API
  return [
    const Todo(description: 'Learn Flutter', completed: true),
    const Todo(description: 'Learn Riverpod'),
  ];
}
