import 'package:flutter/material.dart';
import 'package:interview/widgets/RecentElement.dart';

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
          )
        ],
      ),
    );
  }
}
