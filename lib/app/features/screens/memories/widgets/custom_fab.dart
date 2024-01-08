import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/features/screens/memories/viewmodel/memories_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({
    super.key,
    required this.memoriesViewmodel,
  });

  final MemoriesViewModel memoriesViewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SpeedDial(
        backgroundColor: Colors.grey.shade300,
        elevation: 5,
        activeIcon: Icons.clear,
        icon: Icons.add,
        overlayColor: cblack,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.photo_camera),
            label: 'Camera',
            onTap: () async {
              memoriesViewmodel.pickImageFromCamera();
              await memoriesViewmodel.addMemories();
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.photo_outlined),
            label: 'Galery',
            onTap: () async {
              await memoriesViewmodel.pickImageFromGalery();
              await memoriesViewmodel.addMemories();
            },
          ),
        ],
      );
    });
  }
}
