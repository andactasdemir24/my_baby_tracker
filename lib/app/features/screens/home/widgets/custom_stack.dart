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
                                  side: BorderSide(width: 2.w, color: ColorConst.annualColor),
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
                            Text(
                              info.fullname!,
                              style: TextStyle(color: ColorConst.shade200, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              info.selectedGender!,
                              style: TextStyle(color: ColorConst.shade200, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(info.birthDate!,
                                style: TextStyle(color: ColorConst.shade200, fontSize: 16, fontWeight: FontWeight.bold))
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
                            Text(AppLocalizations.of(context)!.weightText,
                                style: TextStyle(color: ColorConst.cgrey, fontSize: 12)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(weight, height: displayHeight(context) * 0.035),
                                SizedBox(width: displayWidth(context) * 0.025),
                                SizedBox(
                                  height: displayHeight(context) * 0.045,
                                  child: Text(info.weight.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                                ),
                                Text(AppLocalizations.of(context)!.kgs, style: TextStyle(color: ColorConst.cgrey))
                              ],
                            )
                          ],
                        ),
                        VerticalDivider(color: ColorConst.shade400, thickness: 1, endIndent: 35.h, indent: 35.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.heightText,
                                style: TextStyle(color: ColorConst.cgrey, fontSize: 12)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(height, height: displayHeight(context) * 0.035),
                                SizedBox(width: displayWidth(context) * 0.025),
                                SizedBox(
                                  height: displayHeight(context) * 0.045,
                                  child: Text(info.height.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                                ),
                                Text(AppLocalizations.of(context)!.cms, style: TextStyle(color: ColorConst.cgrey))
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
