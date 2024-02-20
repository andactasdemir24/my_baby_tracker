import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';

class CustomDeleteAllButton extends StatelessWidget {
  const CustomDeleteAllButton({
    super.key,
    required this.memoriesViewmodel,
  });

  final MemoriesViewModel memoriesViewmodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          memoriesViewmodel.clearAllMemories();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(AppLocalizations.of(context)!.deleteAll,
                style: TextStyle(color: ColorConst.cred, fontWeight: FontWeight.bold, fontSize: 15.spMin)),
          ),
        ));
  }
}
