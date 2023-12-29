// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingViewmodel on _OnboardingViewmodelBase, Store {
  late final _$isSeenAtom =
      Atom(name: '_OnboardingViewmodelBase.isSeen', context: context);

  @override
  bool get isSeen {
    _$isSeenAtom.reportRead();
    return super.isSeen;
  }

  @override
  set isSeen(bool value) {
    _$isSeenAtom.reportWrite(value, super.isSeen, () {
      super.isSeen = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_OnboardingViewmodelBase.controller', context: context);

  @override
  PageController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(PageController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$onbListAtom =
      Atom(name: '_OnboardingViewmodelBase.onbList', context: context);

  @override
  List<OnboardingModel> get onbList {
    _$onbListAtom.reportRead();
    return super.onbList;
  }

  @override
  set onbList(List<OnboardingModel> value) {
    _$onbListAtom.reportWrite(value, super.onbList, () {
      super.onbList = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_OnboardingViewmodelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$saveIsSeenAsyncAction =
      AsyncAction('_OnboardingViewmodelBase.saveIsSeen', context: context);

  @override
  Future<void> saveIsSeen() {
    return _$saveIsSeenAsyncAction.run(() => super.saveIsSeen());
  }

  late final _$loadIsSeenAsyncAction =
      AsyncAction('_OnboardingViewmodelBase.loadIsSeen', context: context);

  @override
  Future<void> loadIsSeen() {
    return _$loadIsSeenAsyncAction.run(() => super.loadIsSeen());
  }

  late final _$_OnboardingViewmodelBaseActionController =
      ActionController(name: '_OnboardingViewmodelBase', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_OnboardingViewmodelBaseActionController.startAction(
        name: '_OnboardingViewmodelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_OnboardingViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSeen: ${isSeen},
controller: ${controller},
onbList: ${onbList},
currentIndex: ${currentIndex}
    ''';
  }
}
