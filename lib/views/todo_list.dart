import 'package:flutter/material.dart';
import 'package:todo_prac01/viewmodels/todo_viewmodel.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _titleController = TextEditingController();

  final TodoViewmodel _viewModel = TodoViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "할일 추가",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint(_titleController.text);
                      _viewModel.addTodo(_titleController.text, null);
                      setState(() {
                        _titleController.clear();
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _viewModel.todos.length,
                  itemBuilder: (context, index) {
                    final todo = _viewModel.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {
                          _viewModel.toggleTodo(todo.id);
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
