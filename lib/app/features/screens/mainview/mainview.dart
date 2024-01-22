import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final viewModel = locator.get<OnboardingViewmodel>();
  var infoViewModel = locator.get<InformationViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadIsSeen();
    infoViewModel.loadIsSeenInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (viewModel.isSeen == true && infoViewModel.isSeenInformation == true) {
          return const MainNavBar();
        } else if (viewModel.isSeen == true) {
          return const InformationPage();
        } else {
          return const OnboardingPage();
        }
      },
    );
  }
}
