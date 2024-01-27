abstract class Task {
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  Task(this.date, this.title, this.description, this.isDone);
}

class DailyTask extends Task {
  DailyTask(super.date, super.title, super.description, super.isDone);
}

class Journey extends Task {
  final double prog;
  final int duration;
  Journey(super.date, super.title, super.description, super.isDone, this.prog,
      this.duration);
}
