import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        title: 'Eating time',
        description: 'my time to eat',
        dueDate: DateTime(2024, 7, 29, 21, 0)),
    Todo(
        title: 'Beat Lina',
        description: 'I want to beat Lina at this time.',
        dueDate: DateTime(2024, 7, 29, 22, 0)),
    Todo(
        title: 'Landrine Bathe',
        description: 'I will want to take my bath',
        dueDate: DateTime(2024, 7, 29, 23, 0))
  ];
  List<Todo> get todos => _todos;
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void editTodo(Todo todo, int index) {
    _todos[index] = todo;
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].toggleCompleted();
    notifyListeners();
  }
}
