import 'dart:convert';

import 'package:interview/models/task_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Retrieving current date for creating tasks
String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MMM, dd yyyy').format(now);
  return formattedDate;
}

//List for Shorten weekdays
String getDayAbbreviation(int weekday) {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return days[(weekday - 1) % 7]; // Adjusting for the zero-based index
}

//Converting task object to JSON so that it can be stored using sharedpreferences
String taskToJson(Task task) {
  Map<String, dynamic> taskMap = {
    'title': task.title,
    'description': task.description,
    'date': task.date.toIso8601String(),
    'isDone': task.isDone,
  };

  if (task is Journey) {
    taskMap['prog'] = task.prog;
    taskMap['duration'] = task.duration;
  }

  return jsonEncode(taskMap);
}

//converting JSON to object
Task taskFromJson(String json) {
  Map<String, dynamic> taskMap = jsonDecode(json);

  if (taskMap['prog'] != null && taskMap['duration'] != null) {
    // If 'prog' and 'duration' keys are present, it's a Journey
    return Journey(
      DateTime.parse(taskMap['date']),
      taskMap['title'],
      taskMap['description'],
      taskMap['isDone'],
      taskMap['prog'],
      taskMap['duration'],
    );
  } else {
    // Otherwise, it's a DailyTask
    return DailyTask(
      DateTime.parse(taskMap['date']),
      taskMap['title'],
      taskMap['description'],
      taskMap['isDone'],
    );
  }
}

//Saving the serialized task object to sharedpreferences
Future<void> saveTasksToSharedPreferences(List<Task> tasks) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String taskKey = 'tasks_key';

  // Serialize the list of tasks to a list of JSON strings
  List<String> tasksJson = tasks.map((task) => taskToJson(task)).toList();

  // Save the list of JSON strings to SharedPreferences
  await prefs.setStringList(taskKey, tasksJson);
}

Future<List<Task>> getTasksFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String taskKey = 'tasks_key';

  // Retrieve the list of JSON strings from SharedPreferences
  List<String>? tasksJson = prefs.getStringList(taskKey);

  // If tasksJson is null or empty, return an empty list
  if (tasksJson == null || tasksJson.isEmpty) {
    return [];
  }

  // Deserialize each JSON string to a Task object and return the list
  return tasksJson.map((json) => taskFromJson(json)).toList();
}
