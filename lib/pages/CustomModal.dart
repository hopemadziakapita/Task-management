import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';

class MyBottomSheetContent extends StatelessWidget {
  const MyBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
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
            Column(
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
            Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text("Start date"),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "August",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 40,
                          decoration:
                              BoxDecoration(color: AppColors().primaryColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
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
}
