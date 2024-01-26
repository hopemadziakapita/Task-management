import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst, isLast, isActive;
  final String title, description;
  const MyTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isActive,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(color: AppColors().secondaryColor),
      indicatorStyle: IndicatorStyle(
        color: isActive ? Colors.deepPurple : AppColors().secondaryColor,
        width: 15,
      ),
      endChild: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: isActive ? 150 : null,
        decoration: BoxDecoration(
          color: isActive ? Colors.deepPurple : AppColors().secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.black,
                      fontSize: 18),
                ),
                Text(
                  "10:30",
                  style: TextStyle(color: isActive ? Colors.white : null),
                ),
              ],
            ),
            Text(
              description,
              style: TextStyle(color: isActive ? Colors.white : null),
            ),
            Row(
              mainAxisAlignment:
                  isActive ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                isActive
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                        ],
                      )
                    : Icon(Icons.more_horiz)
              ],
            )
          ],
        ),
      ),
    );
  }
}
