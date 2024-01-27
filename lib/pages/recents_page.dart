import 'package:flutter/material.dart';
import 'package:interview/widgets/recent_element.dart';
import 'package:interview/widgets/recent_item.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

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
          const Expanded(
            child: Column(
              children: [
                RecentItem(
                  title: "100 Days of Code",
                  date: "20 Aug 2022",
                ),
                RecentItem(
                  title: "UX research",
                  date: "20 Aug 2022",
                ),
                RecentItem(
                  title: "Epic redeems",
                  date: "20 Aug 2022",
                ),
                RecentItem(
                  title: "Setup purchase",
                  date: "20 Aug 2022",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
