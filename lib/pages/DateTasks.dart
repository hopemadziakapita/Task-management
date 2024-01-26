import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';
import 'package:interview/helpers/Functions.dart';
import 'package:interview/widgets/CustomAppBar.dart';
import 'package:interview/widgets/CustomBottomNav.dart';

class DateTasks extends StatelessWidget {
  const DateTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
      appBar: const CustomAppBar(leadingIcon: Icons.arrow_back),
      bottomNavigationBar: const CustomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
                              // Change color for the current date
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isCurrentDate
                                    ? SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
