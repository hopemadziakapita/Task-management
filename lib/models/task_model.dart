//super class for all types of tasks with generic fields and behaviour
abstract class Task {
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  Task(this.date, this.title, this.description, this.isDone);
}

//Inherited class for daily task minimal functionality close to the super class
class DailyTask extends Task {
  DailyTask(super.date, super.title, super.description, super.isDone);
}

//Inherited class for tasks that happen over a period of time with progres tracking
class Journey extends Task {
  final double prog;
  final int duration;
  Journey(super.date, super.title, super.description, super.isDone, this.prog,
      this.duration);
}
