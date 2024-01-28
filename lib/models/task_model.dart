//super class for all types of tasks with generic fields and behaviour
class Task {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  Task(this.date, this.title, this.description, this.isDone, this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isDone': isDone ? 1 : 0,
    };
  }
}

//Inherited class for daily task minimal functionality close to the super class
class DailyTask extends Task {
  DailyTask(super.date, super.title, super.description, super.isDone, super.id);
}

//Inherited class for tasks that happen over a period of time with progres tracking
class Journey extends Task {
  final double prog;
  final int duration;
  Journey(super.date, super.title, super.description, super.isDone, this.prog,
      this.duration, super.id);
}
