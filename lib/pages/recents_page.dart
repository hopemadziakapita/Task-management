import 'package:flutter/material.dart';
import 'package:interview/helpers/helper_functions.dart';
import 'package:interview/models/task_model.dart';
import 'package:interview/widgets/recent_element.dart';
import 'package:interview/widgets/recent_item.dart';
import 'package:intl/intl.dart';

class Recents extends StatefulWidget {
  const Recents({super.key});

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  List<Task> tasks = [];
  @override
  void initState() {
    getTasksFromSharedPreferences().then((value) => setState(() {
          tasks = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                RecentElement(
                  title: "User Interface Design",
                  prog: 0.5,
                ),
                RecentElement(
                  title: "Elements",
                  prog: 0,
                ),
                RecentElement(
                  title: "User Interface Design",
                  prog: 0.8,
                ),
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text("You have no tasks"))
                : ListView.builder(
                    itemCount: tasks.length < 4 ? tasks.length : 4,
                    itemBuilder: (context, index) {
                      Task task = tasks[index];
                      return RecentItem(
                          title: task.title,
                          date: DateFormat('MMM, dd yyyy').format(task.date));
                    },
                  ),
          )
        ],
      ),
    );
  }
}
