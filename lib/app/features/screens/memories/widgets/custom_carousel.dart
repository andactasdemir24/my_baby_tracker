import 'dart:io';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../viewmodel/memories_viewmodel.dart';

class Deneme extends StatelessWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();

    return Scaffold(
      backgroundColor: shade200,
      appBar: const CustomAppbar(appbarText: galleryText, centerTitle: true),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: memoriesViewmodel.memoriesList.length,
          carouselController: memoriesViewmodel.carouselController,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final imageUrl = memoriesViewmodel.memoriesList[itemIndex].image;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: cwhite, width: 3.w),
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(image: FileImage(File(imageUrl!)), fit: BoxFit.fill),
              ),
            );
          },
          options: CarouselOptions(
              enlargeCenterPage: true, aspectRatio: 7 / 9, autoPlay: false, enableInfiniteScroll: false),
        ),
      ),
    );
  }
}
