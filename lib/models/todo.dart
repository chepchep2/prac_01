class Todo {
  final int id;
  final String title;
  final String description; // title로만 할 경우 필요 없음
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
