// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nappy_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NappyViewModel on _NappyViewModelBase, Store {
  late final _$time4Atom =
      Atom(name: '_NappyViewModelBase.time4', context: context);

  @override
  TimeOfDay? get time4 {
    _$time4Atom.reportRead();
    return super.time4;
  }

  @override
  set time4(TimeOfDay? value) {
    _$time4Atom.reportWrite(value, super.time4, () {
      super.time4 = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_NappyViewModelBase.noteController', context: context);

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

  late final _$isButtonVisible4Atom =
      Atom(name: '_NappyViewModelBase.isButtonVisible4', context: context);

  @override
  bool get isButtonVisible4 {
    _$isButtonVisible4Atom.reportRead();
    return super.isButtonVisible4;
  }

  @override
  set isButtonVisible4(bool value) {
    _$isButtonVisible4Atom.reportWrite(value, super.isButtonVisible4, () {
      super.isButtonVisible4 = value;
    });
  }

  late final _$selectedIndicessAtom =
      Atom(name: '_NappyViewModelBase.selectedIndicess', context: context);

  @override
  ObservableList<NappyModel> get selectedIndicess {
    _$selectedIndicessAtom.reportRead();
    return super.selectedIndicess;
  }

  @override
  set selectedIndicess(ObservableList<NappyModel> value) {
    _$selectedIndicessAtom.reportWrite(value, super.selectedIndicess, () {
      super.selectedIndicess = value;
    });
  }

  late final _$nappyStatusListAtom =
      Atom(name: '_NappyViewModelBase.nappyStatusList', context: context);

  @override
  List<NappyModel> get nappyStatusList {
    _$nappyStatusListAtom.reportRead();
    return super.nappyStatusList;
  }

  @override
  set nappyStatusList(List<NappyModel> value) {
    _$nappyStatusListAtom.reportWrite(value, super.nappyStatusList, () {
      super.nappyStatusList = value;
    });
  }

  late final _$isBlurredAtom =
      Atom(name: '_NappyViewModelBase.isBlurred', context: context);

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

  late final _$tempSelectedIndicesAtom =
      Atom(name: '_NappyViewModelBase.tempSelectedIndices', context: context);

  @override
  ObservableList<NappyModel> get tempSelectedIndices {
    _$tempSelectedIndicesAtom.reportRead();
    return super.tempSelectedIndices;
  }

  @override
  set tempSelectedIndices(ObservableList<NappyModel> value) {
    _$tempSelectedIndicesAtom.reportWrite(value, super.tempSelectedIndices, () {
      super.tempSelectedIndices = value;
    });
  }

  late final _$selectTime4AsyncAction =
      AsyncAction('_NappyViewModelBase.selectTime4', context: context);

  @override
  Future<void> selectTime4(BuildContext context) {
    return _$selectTime4AsyncAction.run(() => super.selectTime4(context));
  }

  late final _$changeVisibleNappyAsyncAction =
      AsyncAction('_NappyViewModelBase.changeVisibleNappy', context: context);

  @override
  Future<void> changeVisibleNappy() {
    return _$changeVisibleNappyAsyncAction
        .run(() => super.changeVisibleNappy());
  }

  late final _$clearTimeAsyncAction =
      AsyncAction('_NappyViewModelBase.clearTime', context: context);

  @override
  Future<void> clearTime() {
    return _$clearTimeAsyncAction.run(() => super.clearTime());
  }

  late final _$toggleSelectedIndexAsyncAction =
      AsyncAction('_NappyViewModelBase.toggleSelectedIndex', context: context);

  @override
  Future<void> toggleSelectedIndex(NappyModel nappyModel) {
    return _$toggleSelectedIndexAsyncAction
        .run(() => super.toggleSelectedIndex(nappyModel));
  }

  late final _$addNappyAsyncAction =
      AsyncAction('_NappyViewModelBase.addNappy', context: context);

  @override
  Future<void> addNappy() {
    return _$addNappyAsyncAction.run(() => super.addNappy());
  }

  late final _$updateNappyAsyncAction =
      AsyncAction('_NappyViewModelBase.updateNappy', context: context);

  @override
  Future<void> updateNappy(Nappy nappy) {
    return _$updateNappyAsyncAction.run(() => super.updateNappy(nappy));
  }

  late final _$_NappyViewModelBaseActionController =
      ActionController(name: '_NappyViewModelBase', context: context);

  @override
  void toggleBlur5(BuildContext context) {
    final _$actionInfo = _$_NappyViewModelBaseActionController.startAction(
        name: '_NappyViewModelBase.toggleBlur5');
    try {
      return super.toggleBlur5(context);
    } finally {
      _$_NappyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startSelection() {
    final _$actionInfo = _$_NappyViewModelBaseActionController.startAction(
        name: '_NappyViewModelBase.startSelection');
    try {
      return super.startSelection();
    } finally {
      _$_NappyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restoreSelection() {
    final _$actionInfo = _$_NappyViewModelBaseActionController.startAction(
        name: '_NappyViewModelBase.restoreSelection');
    try {
      return super.restoreSelection();
    } finally {
      _$_NappyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onBack() {
    final _$actionInfo = _$_NappyViewModelBaseActionController.startAction(
        name: '_NappyViewModelBase.onBack');
    try {
      return super.onBack();
    } finally {
      _$_NappyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSave() {
    final _$actionInfo = _$_NappyViewModelBaseActionController.startAction(
        name: '_NappyViewModelBase.onSave');
    try {
      return super.onSave();
    } finally {
      _$_NappyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time4: ${time4},
noteController: ${noteController},
isButtonVisible4: ${isButtonVisible4},
selectedIndicess: ${selectedIndicess},
nappyStatusList: ${nappyStatusList},
isBlurred: ${isBlurred},
tempSelectedIndices: ${tempSelectedIndices}
    ''';
  }
}
