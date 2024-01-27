import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:interview/helpers/app_colors.dart';
import 'package:interview/helpers/helper_functions.dart';
import 'package:interview/models/task_model.dart';
import 'package:interview/pages/date_tasks.dart';

class MyBottomSheetContent extends StatefulWidget {
  const MyBottomSheetContent({super.key});

  @override
  State<MyBottomSheetContent> createState() => _MyBottomSheetContentState();
}

class _MyBottomSheetContentState extends State<MyBottomSheetContent> {
  List<Task> tasks = [];
  bool status5 = false;
  String month = "August";
  String title = "";

  //retrieving list upon widget load
  @override
  void initState() {
    getTasksFromSharedPreferences().then((value) => setState(() {
          tasks = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Title"),
                  TextField(
                    onChanged: (value) {
                      title = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Task Title",
                      filled: true,
                      fillColor: AppColors().secondaryColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Creation Date"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "26 August 2023",
                      filled: true,
                      fillColor: AppColors().secondaryColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text("Start date"),
                    ),
                    DropdownButton<String>(
                      underline: Container(),
                      value: month, // Initial selected value
                      items: <String>[
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          month = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      7,
                      (index) {
                        DateTime currentDate = DateTime.now();
                        DateTime date = currentDate.add(Duration(days: index));

                        // Check if the date is the current date
                        bool isCurrentDate = date.day == currentDate.day &&
                            date.month == currentDate.month &&
                            date.year == currentDate.year;

                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isCurrentDate
                                  ? AppColors().primaryColor
                                  : null, // Change color for the current date
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getDayAbbreviation(date.weekday),
                                  style: TextStyle(
                                      color: isCurrentDate
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(
                                    color: isCurrentDate
                                        ? Colors.white
                                        : null, // Change text color for the current date
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Get alert for this task",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlutterSwitch(
                        valueFontSize: 10.0,
                        activeColor: AppColors().primaryColor,
                        toggleColor: Colors.purple,
                        inactiveColor: AppColors().secondaryColor,
                        toggleSize: 25.0,
                        value: status5,
                        borderRadius: 30.0,
                        padding: 5.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            status5 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Button for creating tasksss
            GestureDetector(
              onTap: () {
                setState(() {
                  tasks.add(
                    DailyTask(DateTime.now(), title, "", false),
                  );
                });
                saveTasksToSharedPreferences(tasks).then(
                  (value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DateTasks()));
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors().primaryColor,
                ),
                child: const Center(
                  child: Text(
                    "Create Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
