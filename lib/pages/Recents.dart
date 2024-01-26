import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(color: AppColors().primaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
