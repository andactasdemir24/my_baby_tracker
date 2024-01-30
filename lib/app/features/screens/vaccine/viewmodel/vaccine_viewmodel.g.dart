// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VaccineViewModel on _VaccineViewModelBase, Store {
  late final _$dropdownValueAtom =
      Atom(name: '_VaccineViewModelBase.dropdownValue', context: context);

  @override
  String? get dropdownValue {
    _$dropdownValueAtom.reportRead();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String? value) {
    _$dropdownValueAtom.reportWrite(value, super.dropdownValue, () {
      super.dropdownValue = value;
    });
  }

  late final _$dateControllerAtom =
      Atom(name: '_VaccineViewModelBase.dateController', context: context);

  @override
  TextEditingController get dateController {
    _$dateControllerAtom.reportRead();
    return super.dateController;
  }

  @override
  set dateController(TextEditingController value) {
    _$dateControllerAtom.reportWrite(value, super.dateController, () {
      super.dateController = value;
    });
  }

  late final _$vaccineControllerAtom =
      Atom(name: '_VaccineViewModelBase.vaccineController', context: context);

  @override
  TextEditingController get vaccineController {
    _$vaccineControllerAtom.reportRead();
    return super.vaccineController;
  }

  @override
  set vaccineController(TextEditingController value) {
    _$vaccineControllerAtom.reportWrite(value, super.vaccineController, () {
      super.vaccineController = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_VaccineViewModelBase.noteController', context: context);

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
      Atom(name: '_VaccineViewModelBase.isButtonVisible', context: context);

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
      Atom(name: '_VaccineViewModelBase.isBlurred', context: context);

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

  late final _$listAtom =
      Atom(name: '_VaccineViewModelBase.list', context: context);

  @override
  List<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_VaccineViewModelBase.selectDate', context: context);

  @override
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) {
    return _$selectDateAsyncAction
        .run(() => super.selectDate(context, controller));
  }

  late final _$addVaccineAsyncAction =
      AsyncAction('_VaccineViewModelBase.addVaccine', context: context);

  @override
  Future<void> addVaccine() {
    return _$addVaccineAsyncAction.run(() => super.addVaccine());
  }

  late final _$updateVaccineAsyncAction =
      AsyncAction('_VaccineViewModelBase.updateVaccine', context: context);

  @override
  Future<void> updateVaccine(Vaccine vaccine) {
    return _$updateVaccineAsyncAction.run(() => super.updateVaccine(vaccine));
  }

  late final _$_VaccineViewModelBaseActionController =
      ActionController(name: '_VaccineViewModelBase', context: context);

  @override
  void fillList(BuildContext context) {
    final _$actionInfo = _$_VaccineViewModelBaseActionController.startAction(
        name: '_VaccineViewModelBase.fillList');
    try {
      return super.fillList(context);
    } finally {
      _$_VaccineViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBlur(BuildContext context) {
    final _$actionInfo = _$_VaccineViewModelBaseActionController.startAction(
        name: '_VaccineViewModelBase.toggleBlur');
    try {
      return super.toggleBlur(context);
    } finally {
      _$_VaccineViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_VaccineViewModelBaseActionController.startAction(
        name: '_VaccineViewModelBase.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_VaccineViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTime() {
    final _$actionInfo = _$_VaccineViewModelBaseActionController.startAction(
        name: '_VaccineViewModelBase.clearTime');
    try {
      return super.clearTime();
    } finally {
      _$_VaccineViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dropdownValue: ${dropdownValue},
dateController: ${dateController},
vaccineController: ${vaccineController},
noteController: ${noteController},
isButtonVisible: ${isButtonVisible},
isBlurred: ${isBlurred},
list: ${list}
    ''';
  }
}
