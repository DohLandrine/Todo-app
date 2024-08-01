import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/add_edit_todo_page.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Todo')),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              return Card.outlined(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEditTodoPage(
                                todo: Todo(
                                    title: todoProvider.todos[index].title,
                                    description:
                                        todoProvider.todos[index].description,
                                    dueDate: todoProvider.todos[index].dueDate),
                                index: index,
                              ))),
                  child: ListTile(
                    title: Text('${todoProvider.todos[index].title}'),
                    subtitle: Text('${todoProvider.todos[index].description}'),
                    trailing: IconButton(
                        onPressed: () => todoProvider.deleteTodo(index),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blueAccent,
                        )),
                  ),
                ),
              );
            }),

      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_edit_todo_page.dart');
        },
        padding: const EdgeInsets.all(15),
        fillColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
