import 'package:flutter/material.dart';
import 'package:interview/helpers/app_colors.dart';

class RecentItem extends StatelessWidget {
  final String title;
  final String date;
  const RecentItem({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 15, right: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(28, 2, 48, 173),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors().primaryColor,
                        child: const Icon(
                          Icons.event_note,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 26, 0, 31),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              date,
                              style: const TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
