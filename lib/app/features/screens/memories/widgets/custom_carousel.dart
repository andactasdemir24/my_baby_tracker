import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:baby_tracker_app/app/app.dart';

class Deneme extends StatelessWidget {
  const Deneme({super.key});

  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();

    return Scaffold(
      backgroundColor: ColorConst.shade200,
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.galleryText, centerTitle: true),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: memoriesViewmodel.memoriesList.length,
          carouselController: memoriesViewmodel.carouselController,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final imageUrl = memoriesViewmodel.memoriesList[itemIndex].image;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorConst.cwhite, width: 3),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: FileImage(File(imageUrl!)), fit: BoxFit.cover),
              ),
            );
          },
          options: CarouselOptions(
              enlargeCenterPage: true, aspectRatio: 9 / 9, autoPlay: false, enableInfiniteScroll: false),
        ),
      ),
    );
  }
}
