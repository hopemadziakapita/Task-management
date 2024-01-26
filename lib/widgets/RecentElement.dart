import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';

class RecentElement extends StatelessWidget {
  final String title;
  final double prog;
  const RecentElement({
    super.key,
    required this.title,
    required this.prog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors().primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 70,
                  height: 25,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 1,
                        color: Color.fromARGB(204, 255, 255, 255),
                      ),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "1 week left",
                      style:
                          TextStyle(color: AppColors().txtWhite, fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: TextStyle(color: AppColors().txtWhite),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        "progress",
                        style: TextStyle(
                            fontSize: 10, color: AppColors().txtWhite),
                      ),
                    ),
                    Text(
                      "${(prog * 100).ceil()}%",
                      style:
                          TextStyle(fontSize: 10, color: AppColors().txtWhite),
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: prog,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
