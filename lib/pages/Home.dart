import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';
import 'package:interview/pages/CustomModal.dart';
import 'package:interview/pages/Recents.dart';
import 'package:interview/widgets/CustomAppBar.dart';
import 'package:interview/widgets/FilterTabs.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      backgroundColor: AppColors().bgColor,
      appBar: const CustomAppBar(leadingIcon: Icons.segment),
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_outlined),
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: .0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                              BorderSide(
                                  color: AppColors().primaryColor, width: 2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hope",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "welcome back",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black26),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "My tasks",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        FilterTab(
                            title: "Recently", callback: () {}, isActive: true),
                        FilterTab(
                            title: "Today", callback: () {}, isActive: false),
                        FilterTab(
                            title: "Upcoming",
                            callback: () {},
                            isActive: false),
                        FilterTab(
                            title: "Later", callback: () {}, isActive: false),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Recents(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
