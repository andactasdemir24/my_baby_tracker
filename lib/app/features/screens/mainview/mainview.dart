import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/features/screens/Informations/view/information_page.dart';
import 'package:baby_tracker_app/app/features/screens/Informations/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/main_navbar/main_navbar.dart';
import 'package:baby_tracker_app/app/features/screens/onboarding/view/onboarding_page.dart';
import 'package:baby_tracker_app/app/features/screens/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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