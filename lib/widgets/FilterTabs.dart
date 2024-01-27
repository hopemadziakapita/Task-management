import 'package:flutter/material.dart';
import 'package:interview/helpers/Colors.dart';

// ignore: must_be_immutable
class FilterTab extends StatefulWidget {
  String title;
  bool isActive;
  VoidCallback callback;
  FilterTab(
      {super.key,
      required this.title,
      required this.callback,
      required this.isActive});

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.callback,
        child: Text(
          widget.title,
          style: widget.isActive
              ? TextStyle(
                  color: AppColors().primaryColor, fontWeight: FontWeight.w400)
              : const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 12),
        ),
      ),
    );
  }
}
