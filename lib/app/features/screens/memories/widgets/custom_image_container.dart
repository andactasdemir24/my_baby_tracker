import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/hive/model/memories_model.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.memories,
  });

  final MemoriesModel memories;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: cwhite, width: 1),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: FileImage(File(memories.image!)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
