class Todo {
  final int id;
  String title;
  String description; // title로만 할 경우 필요 없음
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
