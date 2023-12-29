// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptomps_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SymptompsViewmodel on _SymptompsViewmodelBase, Store {
  late final _$time3Atom =
      Atom(name: '_SymptompsViewmodelBase.time3', context: context);

  @override
  TimeOfDay? get time3 {
    _$time3Atom.reportRead();
    return super.time3;
  }

  @override
  set time3(TimeOfDay? value) {
    _$time3Atom.reportWrite(value, super.time3, () {
      super.time3 = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_SymptompsViewmodelBase.noteController', context: context);

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

  late final _$isButtonVisible3Atom =
      Atom(name: '_SymptompsViewmodelBase.isButtonVisible3', context: context);

  @override
  bool get isButtonVisible3 {
    _$isButtonVisible3Atom.reportRead();
    return super.isButtonVisible3;
  }

  @override
  set isButtonVisible3(bool value) {
    _$isButtonVisible3Atom.reportWrite(value, super.isButtonVisible3, () {
      super.isButtonVisible3 = value;
    });
  }

  late final _$selectedIndicesAtom =
      Atom(name: '_SymptompsViewmodelBase.selectedIndices', context: context);

  @override
  ObservableList<SymptopmsModel> get selectedIndices {
    _$selectedIndicesAtom.reportRead();
    return super.selectedIndices;
  }

  @override
  set selectedIndices(ObservableList<SymptopmsModel> value) {
    _$selectedIndicesAtom.reportWrite(value, super.selectedIndices, () {
      super.selectedIndices = value;
    });
  }

  late final _$symptompsListAtom =
      Atom(name: '_SymptompsViewmodelBase.symptompsList', context: context);

  @override
  List<SymptopmsModel> get symptompsList {
    _$symptompsListAtom.reportRead();
    return super.symptompsList;
  }

  @override
  set symptompsList(List<SymptopmsModel> value) {
    _$symptompsListAtom.reportWrite(value, super.symptompsList, () {
      super.symptompsList = value;
    });
  }

  late final _$isBlurred3Atom =
      Atom(name: '_SymptompsViewmodelBase.isBlurred3', context: context);

  @override
  bool get isBlurred3 {
    _$isBlurred3Atom.reportRead();
    return super.isBlurred3;
  }

  @override
  set isBlurred3(bool value) {
    _$isBlurred3Atom.reportWrite(value, super.isBlurred3, () {
      super.isBlurred3 = value;
    });
  }

  late final _$isBlurred4Atom =
      Atom(name: '_SymptompsViewmodelBase.isBlurred4', context: context);

  @override
  bool get isBlurred4 {
    _$isBlurred4Atom.reportRead();
    return super.isBlurred4;
  }

  @override
  set isBlurred4(bool value) {
    _$isBlurred4Atom.reportWrite(value, super.isBlurred4, () {
      super.isBlurred4 = value;
    });
  }

  late final _$selectTime3AsyncAction =
      AsyncAction('_SymptompsViewmodelBase.selectTime3', context: context);

  @override
  Future<void> selectTime3(BuildContext context) {
    return _$selectTime3AsyncAction.run(() => super.selectTime3(context));
  }

  late final _$changeVisibleAsyncAction =
      AsyncAction('_SymptompsViewmodelBase.changeVisible', context: context);

  @override
  Future<void> changeVisible() {
    return _$changeVisibleAsyncAction.run(() => super.changeVisible());
  }

  late final _$clearTimeAsyncAction =
      AsyncAction('_SymptompsViewmodelBase.clearTime', context: context);

  @override
  Future<void> clearTime() {
    return _$clearTimeAsyncAction.run(() => super.clearTime());
  }

  late final _$toggleSelectedIndexAsyncAction = AsyncAction(
      '_SymptompsViewmodelBase.toggleSelectedIndex',
      context: context);

  @override
  Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) {
    return _$toggleSelectedIndexAsyncAction
        .run(() => super.toggleSelectedIndex(symptopmsModel));
  }

  late final _$addSymptompsAsyncAction =
      AsyncAction('_SymptompsViewmodelBase.addSymptomps', context: context);

  @override
  Future<void> addSymptomps() {
    return _$addSymptompsAsyncAction.run(() => super.addSymptomps());
  }

  late final _$updateSymptompsAsyncAction =
      AsyncAction('_SymptompsViewmodelBase.updateSymptomps', context: context);

  @override
  Future<void> updateSymptomps(Symptomps symptomps) {
    return _$updateSymptompsAsyncAction
        .run(() => super.updateSymptomps(symptomps));
  }

  late final _$_SymptompsViewmodelBaseActionController =
      ActionController(name: '_SymptompsViewmodelBase', context: context);

  @override
  void toggleBlur3(BuildContext context) {
    final _$actionInfo = _$_SymptompsViewmodelBaseActionController.startAction(
        name: '_SymptompsViewmodelBase.toggleBlur3');
    try {
      return super.toggleBlur3(context);
    } finally {
      _$_SymptompsViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBlur4(BuildContext context) {
    final _$actionInfo = _$_SymptompsViewmodelBaseActionController.startAction(
        name: '_SymptompsViewmodelBase.toggleBlur4');
    try {
      return super.toggleBlur4(context);
    } finally {
      _$_SymptompsViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time3: ${time3},
noteController: ${noteController},
isButtonVisible3: ${isButtonVisible3},
selectedIndices: ${selectedIndices},
symptompsList: ${symptompsList},
isBlurred3: ${isBlurred3},
isBlurred4: ${isBlurred4}
    ''';
  }
}
