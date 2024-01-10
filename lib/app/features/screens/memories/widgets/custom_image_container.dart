import 'dart:io';
import 'package:baby_tracker_app/app/features/screens/memories/widgets/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/model/memories_model.dart';
import '../viewmodel/memories_viewmodel.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
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
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: cwhite, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(image: FileImage(File(memories.image!)), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
