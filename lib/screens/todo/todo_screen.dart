import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_integration/models/todo/todo.dart';
import 'package:riverpod_integration/providers/todo/todo_notifier_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(todoNotifierProvider.notifier).addTodo(
              const Todo(description: 'Learn Riverpod'),
            );
      },
      child: const Text('Add Todo'),
    );
  }
}
