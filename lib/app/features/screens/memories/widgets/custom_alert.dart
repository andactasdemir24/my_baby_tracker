// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return Observer(builder: (context) {
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
                memoriesViewmodel.deleteMemories(id);
                Navigator.of(context).pop();
              }),
        ],
      );
    });
  }
}
