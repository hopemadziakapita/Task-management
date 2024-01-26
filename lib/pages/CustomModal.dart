import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';

class MyBottomSheetContent extends StatefulWidget {
  const MyBottomSheetContent({super.key});

  @override
  State<MyBottomSheetContent> createState() => _MyBottomSheetContentState();
}

class _MyBottomSheetContentState extends State<MyBottomSheetContent> {
  String month = "August";
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 900,
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
                      hintText: "17 August 2023",
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
                children: [Text("Get alert for this task")],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors().primaryColor,
              ),
              child: const Center(
                child: Text(
                  "Create Task",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDayAbbreviation(int weekday) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[(weekday - 1) % 7]; // Adjusting for the zero-based index
  }
}
