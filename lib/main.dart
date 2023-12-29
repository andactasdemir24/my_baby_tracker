import 'dart:io';

import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/features/screens/mainview/mainview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/core/hive/data/hive_box.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid && Platform.isWindows) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await Hive.initFlutter();
  hiveRegisterAdapter();
  await hiveBox();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
