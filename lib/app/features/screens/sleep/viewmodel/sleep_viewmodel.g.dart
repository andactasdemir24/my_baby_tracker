// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SleepViewModel on _SleepViewModelBase, Store {
  late final _$time1Atom =
      Atom(name: '_SleepViewModelBase.time1', context: context);

  @override
  TimeOfDay? get time1 {
    _$time1Atom.reportRead();
    return super.time1;
  }

  @override
  set time1(TimeOfDay? value) {
    _$time1Atom.reportWrite(value, super.time1, () {
      super.time1 = value;
    });
  }

  late final _$time2Atom =
      Atom(name: '_SleepViewModelBase.time2', context: context);

  @override
  TimeOfDay? get time2 {
    _$time2Atom.reportRead();
    return super.time2;
  }

  @override
  set time2(TimeOfDay? value) {
    _$time2Atom.reportWrite(value, super.time2, () {
      super.time2 = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_SleepViewModelBase.noteController', context: context);

  @override
  TextEditingController get noteController {
    _$noteControllerAtom.reportRead();
    return super.noteController;
  }

  @override
  set noteController(TextEditingController value) {
    _$noteControllerAtom.reportWrite(value, super.noteController, () {
      super.noteController = value;
    });
  }

  late final _$isButtonVisible2Atom =
      Atom(name: '_SleepViewModelBase.isButtonVisible2', context: context);

  @override
  bool get isButtonVisible2 {
    _$isButtonVisible2Atom.reportRead();
    return super.isButtonVisible2;
  }

  @override
  set isButtonVisible2(bool value) {
    _$isButtonVisible2Atom.reportWrite(value, super.isButtonVisible2, () {
      super.isButtonVisible2 = value;
    });
  }

  late final _$isBlurred2Atom =
      Atom(name: '_SleepViewModelBase.isBlurred2', context: context);

  @override
  bool get isBlurred2 {
    _$isBlurred2Atom.reportRead();
    return super.isBlurred2;
  }

  @override
  set isBlurred2(bool value) {
    _$isBlurred2Atom.reportWrite(value, super.isBlurred2, () {
      super.isBlurred2 = value;
    });
  }

  late final _$selectTime1AsyncAction =
      AsyncAction('_SleepViewModelBase.selectTime1', context: context);

  @override
  Future<void> selectTime1(BuildContext context) {
    return _$selectTime1AsyncAction.run(() => super.selectTime1(context));
  }

  late final _$selectTime2AsyncAction =
      AsyncAction('_SleepViewModelBase.selectTime2', context: context);

  @override
  Future<void> selectTime2(BuildContext context) {
    return _$selectTime2AsyncAction.run(() => super.selectTime2(context));
  }

  late final _$addSleepAsyncAction =
      AsyncAction('_SleepViewModelBase.addSleep', context: context);

  @override
  Future<void> addSleep() {
    return _$addSleepAsyncAction.run(() => super.addSleep());
  }

  late final _$updateSleepAsyncAction =
      AsyncAction('_SleepViewModelBase.updateSleep', context: context);

  @override
  Future<void> updateSleep(Sleep sleep) {
    return _$updateSleepAsyncAction.run(() => super.updateSleep(sleep));
  }

  late final _$_SleepViewModelBaseActionController =
      ActionController(name: '_SleepViewModelBase', context: context);

  @override
  void toggleBlur2(BuildContext context) {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.toggleBlur2');
    try {
      return super.toggleBlur2(context);
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTime() {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.clearTime');
    try {
      return super.clearTime();
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time1: ${time1},
time2: ${time2},
noteController: ${noteController},
isButtonVisible2: ${isButtonVisible2},
isBlurred2: ${isBlurred2}
    ''';
  }
}
