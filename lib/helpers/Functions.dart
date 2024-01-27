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

//Saving the serialized task object to sharedpreferences
Future<void> saveTaskToSharedPreferences(Task task) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String taskKey = 'task_key';

  // Serialize the task to JSON
  String taskJson = taskToJson(task);

  // Save the JSON string to SharedPreferences
  await prefs.setString(taskKey, taskJson);
}
