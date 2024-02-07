import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baby_tracker_app/app/app.dart';

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
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: displayHeight(context) * 0.21,
                decoration: BoxDecoration(
                  color: ColorConst.homeAppbar,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.15,
                child: Padding(
                  padding: EdgeInsets.only(left: displayHeight(context) * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      info.image != null
                          ? Container(
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(width: 2, color: ColorConst.annualColor),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 40.r,
                                backgroundImage: FileImage(File(info.image!)),
                              ),
                            )
                          : const CircleAvatar(),
                      SizedBox(width: displayWidth(context) * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: displayWidth(context),
                              child: Text(
                                info.fullname!,
                                style: TextStyle(
                                    color: ColorConst.shade200, fontSize: 16.spMin, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context),
                              child: Text(
                                info.selectedGender!,
                                style: TextStyle(
                                    color: ColorConst.shade200, fontSize: 16.spMin, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context),
                              child: Text(info.birthDate!,
                                  style: TextStyle(
                                      color: ColorConst.shade200, fontSize: 16.spMin, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: displayHeight(context) * 0.15,
                left: displayHeight(context) * 0.025,
                right: displayHeight(context) * 0.025,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.15,
                    decoration: BoxDecoration(
                      color: ColorConst.cwhite,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: displayWidth(context) * 0.2,
                              child: Text(
                                  textAlign: TextAlign.start,
                                  AppLocalizations.of(context)!.weightText,
                                  style: TextStyle(color: ColorConst.cgrey, fontSize: 12.spMin)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImagesConst.weight,
                                  width: 30.spMin,
                                  height: 30.spMin,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: displayWidth(context) * 0.025),
                                SizedBox(
                                  width: displayWidth(context) * 0.1,
                                  child: Text(info.weight.toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.spMin)),
                                ),
                                SizedBox(
                                    width: displayWidth(context) * 0.1,
                                    child: Text(AppLocalizations.of(context)!.kgs,
                                        style: TextStyle(color: ColorConst.cgrey, fontSize: 12.spMin)))
                              ],
                            )
                          ],
                        ),
                        VerticalDivider(color: ColorConst.shade400, thickness: 1, endIndent: 35.h, indent: 35.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: displayWidth(context) * 0.2,
                              child: Text(
                                  textAlign: TextAlign.start,
                                  AppLocalizations.of(context)!.heightText,
                                  style: TextStyle(color: ColorConst.cgrey, fontSize: 12.spMin)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImagesConst.height,
                                  width: 32.spMin,
                                  height: 30.spMin,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: displayWidth(context) * 0.025),
                                SizedBox(
                                  width: displayWidth(context) * 0.15,
                                  child: Text(info.height.toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.spMin)),
                                ),
                                SizedBox(
                                    width: displayWidth(context) * 0.1,
                                    child: Text(AppLocalizations.of(context)!.cms,
                                        style: TextStyle(color: ColorConst.cgrey, fontSize: 12.spMin)))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
