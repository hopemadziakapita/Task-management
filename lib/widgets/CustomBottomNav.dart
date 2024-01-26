import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';
import 'package:interview/pages/CustomModal.dart';

class CustomNav extends StatelessWidget {
  const CustomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home_outlined,
              color: AppColors().primaryColor,
            ),
            const Icon(Icons.calendar_month),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return MyBottomSheetContent();
                  },
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors().primaryColor,
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(Icons.description_outlined),
            const Icon(Icons.person_2_outlined)
          ],
        ),
      ),
    );
  }
}
