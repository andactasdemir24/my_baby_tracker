// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomNappyList extends StatelessWidget {
  const CustomNappyList({
    Key? key,
    required this.text,
  }) : super(key: key);

  final Text text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NappyList(),
          ),
        );
      },
      child: Container(
        width: displayWidth(context) * 0.88,
        height: displayHeight(context) * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorConst.annualColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (context) {
                    return text;
                  },
                ),
                Icon(Baby.left, color: ColorConst.settingsIndex)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
