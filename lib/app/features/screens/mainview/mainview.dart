import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/view/inapp_page.dart';
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

  @override
  void initState() {
    super.initState();
    viewModel.loadIsSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return viewModel.isSeen ? const InAppPage() : const OnboardingPage();
      },
    );
  }
}
