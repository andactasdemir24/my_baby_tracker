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
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.deleteText),
                content: SingleChildScrollView(
                  child: ListBody(children: <Widget>[Text(AppLocalizations.of(context)!.listBodyText)]),
                ),
                actions: <Widget>[
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.cancelText),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.okeyText),
                      onPressed: () {
                        memoriesViewmodel.clearAllMemories();
                        Navigator.of(context).pop();
                      }),
                ],
              );
            },
          );
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
