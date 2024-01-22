// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return Observer(builder: (context) {
      return AlertDialog(
        title: const Text(deleteText),
        content: const SingleChildScrollView(
          child: ListBody(children: <Widget>[Text(listBodyText)]),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text(cancelText),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          TextButton(
              child: const Text(okeyText),
              onPressed: () {
                memoriesViewmodel.deleteMemories(id);
                Navigator.of(context).pop();
              }),
        ],
      );
    });
  }
}
