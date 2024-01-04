import 'dart:io';

import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../Informations/viewmodel/information_viewmodel.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.informationVeiwmodel,
  });

  final InformationViewModel informationVeiwmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (informationVeiwmodel.selectedInformation != null) {
        var info = informationVeiwmodel.selectedInformation!;
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: homeAppbar,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
              ),
            ),
            SizedBox(
              width: 270.w,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  info.image != null
                      ? Container(
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(width: 2.w, color: shade400),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: FileImage(File(info.image!)),
                          ),
                        )
                      : const CircleAvatar(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${info.fullname!} / ${info.genderList!.map((name) => name.name).join('')}',
                        style: TextStyle(color: shade200, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(info.birthDate!,
                          style: TextStyle(color: shade200, fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 100.h,
              left: 15.w,
              right: 15.w,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.h,
                decoration: BoxDecoration(
                  color: cwhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(weightText, style: TextStyle(color: cgrey, fontSize: 12)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(weight, height: 25.h),
                            SizedBox(width: 10.w),
                            SizedBox(
                              height: 32.h,
                              child: Text(info.weight.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                            ),
                            const Text(kgs, style: TextStyle(color: cgrey))
                          ],
                        )
                      ],
                    ),
                    VerticalDivider(color: shade400, thickness: 1, endIndent: 35.h, indent: 35.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(heightText, style: TextStyle(color: cgrey, fontSize: 12)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(height, height: 25.h),
                            SizedBox(width: 10.w),
                            SizedBox(
                              height: 32.h,
                              child: Text(info.height.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                            ),
                            const Text(cms, style: TextStyle(color: cgrey))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
