import 'dart:io';
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomImageContainerMemories extends StatelessWidget {
  const CustomImageContainerMemories({
    super.key,
    required this.memories,
  });

  final MemoriesModel memories;

  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          int pageIndex = memoriesViewmodel.memoriesList.indexOf(memories);
          if (pageIndex != -1) {
            memoriesViewmodel.carouselController.animateToPage(pageIndex);
          }
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Deneme()));
      },
      onLongPress: () {
        memoriesViewmodel.showMyDialog(context, memories.id!);
      },
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorConst.cwhite, width: 1),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: FileImage(File(memories.image!)), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
