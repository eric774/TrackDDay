class Task {
  final String name;
  bool isDone;
  int score;

  Task({this.name, this.isDone = false, this.score = 0});

  void toggleDone() {
    isDone = !isDone;
  }
}
