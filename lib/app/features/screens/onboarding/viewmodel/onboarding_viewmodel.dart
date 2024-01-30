import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_tracker_app/app/app.dart';
part 'onboarding_viewmodel.g.dart';

class OnboardingViewmodel = _OnboardingViewmodelBase with _$OnboardingViewmodel;

abstract class _OnboardingViewmodelBase with Store {
  @observable
  bool isSeen = false;

  @observable
  PageController controller = PageController();

  @observable
  List<OnboardingModel> onbList = [
    OnboardingModel(ImagesConst.onboarding1, onb1Title, onb1Description),
    OnboardingModel(ImagesConst.onboarding2, onb2Title, onb2Description),
    OnboardingModel(ImagesConst.onboarding3, onb3Title, onb3Description),
  ];

  @observable
  int currentIndex = 0;

  @action
  Future<void> saveIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', true);
  }

  @action
  Future<void> saveIsSeenFalse() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', false);
  }

  @action
  Future<void> loadIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    isSeen = preferences.getBool('seen') ?? false;
  }

  @action
  void changeIndex(int index) {
    currentIndex = index;
  }
}
