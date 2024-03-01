// ignore_for_file: library_private_types_in_public_api

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
  List<OnboardingModel> onbList = [];
  //bu fonksiyon ve üstteki bağlantılıdır. Bağlantı işse şudur: normalde alttaki listenin içinde yazanlar yukarıda yazılı oldup normal bir şekilde kullanılabilirdi.
  //fakat localizations işlemi yaptığımda bir context istediği için bende mecbur fonk içine aynı listeyi açıp elemanları yazdım.
  //ve bu fonksiyonu viewda çağırdım. üstttekine gitti veriler
  @action
  void fillList(BuildContext context) {
    onbList = [
      OnboardingModel(ImagesConst.onboarding1, AppLocalizations.of(context)!.onb1Title,
          AppLocalizations.of(context)!.onb1Description),
      OnboardingModel(ImagesConst.onboarding2, AppLocalizations.of(context)!.onb2Title,
          AppLocalizations.of(context)!.onb2Description),
      OnboardingModel(ImagesConst.onboarding3, AppLocalizations.of(context)!.onb3Title,
          AppLocalizations.of(context)!.onb3Description)
    ];
  }

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
