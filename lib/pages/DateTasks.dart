import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';
import 'package:interview/helpers/Functions.dart';
import 'package:interview/models/task_model.dart';
import 'package:interview/widgets/CustomAppBar.dart';
import 'package:interview/widgets/CustomBottomNav.dart';
import 'package:interview/widgets/my_timeline.dart';

class DateTasks extends StatefulWidget {
  const DateTasks({super.key});

  @override
  State<DateTasks> createState() => _DateTasksState();
}

class _DateTasksState extends State<DateTasks> {
  List tasks = [];
  int index = 0;
  @override
  void initState() {
    getTasks();
    super.initState();
  }

  Future<void> getTasks() async {
    await getTasksFromSharedPreferences().then((value) {
      setState(() {
        tasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
      appBar: const CustomAppBar(leadingIcon: Icons.arrow_back),
      bottomNavigationBar: const CustomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getCurrentDate(),
                    ),
                    const Text(
                      "Today",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          7,
                          (index) {
                            DateTime currentDate = DateTime.now();
                            DateTime date =
                                currentDate.add(Duration(days: index));

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
                                  // Change color for the current date
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    isCurrentDate
                                        ? const SizedBox(
                                            height: 15,
                                          )
                                        : Container(),
                                    Text(
                                      getDayAbbreviation(date.weekday),
                                      style: TextStyle(
                                          fontWeight: isCurrentDate
                                              ? FontWeight.w600
                                              : FontWeight.w400),
                                    ),
                                    Text(
                                      date.day.toString(),
                                      style: TextStyle(
                                        color: isCurrentDate
                                            ? AppColors().primaryColor
                                            : null, // Change text color for the current date
                                      ),
                                    ),
                                    isCurrentDate
                                        ? CircleAvatar(
                                            radius: 2,
                                            backgroundColor:
                                                AppColors().primaryColor,
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: ((context, index) {
                          Task task = tasks[index];
                          return MyTimeLineTile(
                            isFirst: tasks[index] == 0 ? true : false,
                            isLast: false,
                            isActive: false,
                            title: task.title,
                            description: task.description,
                          );
                        }),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
