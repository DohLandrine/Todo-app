import 'package:flutter/material.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import 'pages/homepage.dart';
import 'pages/add_edit_todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const HomePage(),
          '/add_edit_todo_page.dart': (context) => const AddEditTodoPage(),
        },
      ),
    );
  }
}
