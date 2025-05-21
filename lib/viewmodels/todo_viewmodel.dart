import 'package:todo_prac01/models/todo.dart' show Todo;

class TodoViewmodel {
  List<Todo> todos = [];

  void addTodo(String title, String? description) {
    final newTodo = Todo(
      id: todos.isEmpty ? 1 : todos.last.id + 1,
      title: title,
      description: description ?? "",
      isCompleted: false,
    );
    todos.add(newTodo);
  }

  void deleteTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  void updateTodo(int id, String title, String? description) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.title = title;
    todo.description = description ?? "";
  }

  void toggleTodo(int id) {
    final todoIdx = todos.indexWhere((todo) => todo.id == id);
    if (todoIdx != -1) {
      todos[todoIdx].isCompleted = !todos[todoIdx].isCompleted;
    }
  }

  List<Todo> getCompletedTodos() {
    return todos.where((todo) => todo.isCompleted).toList();
  }

  List<Todo> getIncompletedTodos() {
    return todos.where((todo) => !todo.isCompleted).toList();
  }
}
