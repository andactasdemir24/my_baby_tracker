// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedingViewModel on _FeedingViewModelBase, Store {
  late final _$timeAtom =
      Atom(name: '_FeedingViewModelBase.time', context: context);

  @override
  TimeOfDay? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$amountControllerAtom =
      Atom(name: '_FeedingViewModelBase.amountController', context: context);

  @override
  TextEditingController get amountController {
    _$amountControllerAtom.reportRead();
    return super.amountController;
  }

  @override
  set amountController(TextEditingController value) {
    _$amountControllerAtom.reportWrite(value, super.amountController, () {
      super.amountController = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_FeedingViewModelBase.noteController', context: context);

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

  late final _$isButtonVisibleAtom =
      Atom(name: '_FeedingViewModelBase.isButtonVisible', context: context);

  @override
  bool get isButtonVisible {
    _$isButtonVisibleAtom.reportRead();
    return super.isButtonVisible;
  }

  @override
  set isButtonVisible(bool value) {
    _$isButtonVisibleAtom.reportWrite(value, super.isButtonVisible, () {
      super.isButtonVisible = value;
    });
  }

  late final _$isBlurredAtom =
      Atom(name: '_FeedingViewModelBase.isBlurred', context: context);

  @override
  bool get isBlurred {
    _$isBlurredAtom.reportRead();
    return super.isBlurred;
  }

  @override
  set isBlurred(bool value) {
    _$isBlurredAtom.reportWrite(value, super.isBlurred, () {
      super.isBlurred = value;
    });
  }

  late final _$selectTimeAsyncAction =
      AsyncAction('_FeedingViewModelBase.selectTime', context: context);

  @override
  Future<void> selectTime(BuildContext context) {
    return _$selectTimeAsyncAction.run(() => super.selectTime(context));
  }

  late final _$showMyDialogAsyncAction =
      AsyncAction('_FeedingViewModelBase.showMyDialog', context: context);

  @override
  Future<void> showMyDialog(BuildContext context) {
    return _$showMyDialogAsyncAction.run(() => super.showMyDialog(context));
  }

  late final _$addFeedingAsyncAction =
      AsyncAction('_FeedingViewModelBase.addFeeding', context: context);

  @override
  Future<void> addFeeding() {
    return _$addFeedingAsyncAction.run(() => super.addFeeding());
  }

  late final _$updateFeedingAsyncAction =
      AsyncAction('_FeedingViewModelBase.updateFeeding', context: context);

  @override
  Future<void> updateFeeding(Feeding feed) {
    return _$updateFeedingAsyncAction.run(() => super.updateFeeding(feed));
  }

  late final _$_FeedingViewModelBaseActionController =
      ActionController(name: '_FeedingViewModelBase', context: context);

  @override
  void toggleBlur(BuildContext context) {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.toggleBlur');
    try {
      return super.toggleBlur(context);
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTime() {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.clearTime');
    try {
      return super.clearTime();
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time: ${time},
amountController: ${amountController},
noteController: ${noteController},
isButtonVisible: ${isButtonVisible},
isBlurred: ${isBlurred}
    ''';
  }
}
