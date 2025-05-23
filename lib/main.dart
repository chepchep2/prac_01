import 'package:flutter/material.dart';
import 'package:todo_prac01/views/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo App', home: TodoList());
  }
}
