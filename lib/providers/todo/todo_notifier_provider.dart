/*
 * 
 * final name = SomeNotifierProvider.someModifier<MyNotifier, Result>(MyNotifier.new);
  class MyNotifier extends SomeNotifier<Result> {
    @override
    Result build() {
      <your logic here>
    }
    <your methods here>
  }
 * 
 */

import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_integration/models/todo/todo.dart';
import 'package:http/http.dart' as http;

part 'todo_notifier_provider.g.dart';

//Class-Based way of creating a provider
//Can perform side-effects using public methods
@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Future<List<Todo>> build() async {
    // var rs = [
    //   const Todo(description: 'Learn Flutter', completed: true),
    //   const Todo(description: 'Learn Riverpod'),
    // ];
    // return Future<List<Todo>>.value(rs);

    // Simulate a network request. This would normally come from a real API
    return [];
  }

  Future<void> addTodo(Todo todo) async {
    final res = await http.post(
      Uri.https('your_api.com', '/todos'),
      // We serialize our Todo object and POST it to the server.
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );

    // If the server returns a 200 OK response, we add the todo to our list
    List<Todo> newTodos = (jsonDecode(res.body) as List)
        .cast<Map<String, Object?>>()
        .map(Todo.fromJson)
        .toList();

    //C1:
    // state = AsyncData(newTodos);

    //C2:
    //https://riverpod.dev/docs/essentials/side_effects#using-refinvalidateself-to-refresh-the-provider
    //this case use for: todos use in multiple screen or multiple users in the server.
    //or current todos in app is sorting and filtering, and we add new todo to the server. not update the current todos UI in app.
    //so we need to refresh the provider to get the latest data in the server.
    ref.invalidateSelf();
    // Once the post request is done, we can mark the local cache as dirty.
    // This will cause "build" on our notifier to asynchronously be called again,
    // and will notify listeners when doing so.

    // (Optional) We can then wait for the new state to be computed.
    // This ensures "addTodo" does not complete until the new state is available.
    await future;

    // C3:
    // We can then manually update the local cache. For this, we'll need to
    // obtain the previous state.
    // Caution: The previous state may still be loading or in error state.
    // A graceful way of handling this would be to read `this.future` instead
    // of `this.state`, which would enable awaiting the loading state, and
    // throw an error if the state is in error state.

    // final previousState = await future;

    // We can then update the state, by creating a new state object. This will notify all listeners.

    // state = AsyncData([...previousState, todo]);

    //==== NOTE => Consider the situation and choose the most appropriate way.
  }

  //TODO:
  // Add methods to mutate the state of the provider
}
