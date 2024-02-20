import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({
    super.key,
    required this.memoriesViewmodel,
  });

  final MemoriesViewModel memoriesViewmodel;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: ColorConst.fabbutton,
      iconTheme: IconThemeData(color: ColorConst.cwhite),
      elevation: 5,
      activeIcon: Icons.clear,
      icon: Icons.add,
      overlayColor: ColorConst.shade500,
      spacing: 10,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.photo_camera),
          label: AppLocalizations.of(context)!.camera,
          onTap: () async {
            await memoriesViewmodel.pickImageFromCamera();
            await memoriesViewmodel.addMemories();
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.photo_outlined),
          label: AppLocalizations.of(context)!.gallery,
          onTap: () async {
            await memoriesViewmodel.pickImageFromGallery();
            await memoriesViewmodel.addMemories();
          },
        ),
      ],
    );
  }
}
