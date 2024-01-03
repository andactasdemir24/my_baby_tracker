// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationViewModel on _InformationViewModelBase, Store {
  late final _$selectedImageAtom =
      Atom(name: '_InformationViewModelBase.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$isBlurredAtom =
      Atom(name: '_InformationViewModelBase.isBlurred', context: context);

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

  late final _$isButtonVisibleInfAtom = Atom(
      name: '_InformationViewModelBase.isButtonVisibleInf', context: context);

  @override
  bool get isButtonVisibleInf {
    _$isButtonVisibleInfAtom.reportRead();
    return super.isButtonVisibleInf;
  }

  @override
  set isButtonVisibleInf(bool value) {
    _$isButtonVisibleInfAtom.reportWrite(value, super.isButtonVisibleInf, () {
      super.isButtonVisibleInf = value;
    });
  }

  late final _$infoListAtom =
      Atom(name: '_InformationViewModelBase.infoList', context: context);

  @override
  List<Information> get infoList {
    _$infoListAtom.reportRead();
    return super.infoList;
  }

  @override
  set infoList(List<Information> value) {
    _$infoListAtom.reportWrite(value, super.infoList, () {
      super.infoList = value;
    });
  }

  late final _$selectedInformationAtom = Atom(
      name: '_InformationViewModelBase.selectedInformation', context: context);

  @override
  Information? get selectedInformation {
    _$selectedInformationAtom.reportRead();
    return super.selectedInformation;
  }

  @override
  set selectedInformation(Information? value) {
    _$selectedInformationAtom.reportWrite(value, super.selectedInformation, () {
      super.selectedInformation = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_InformationViewModelBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$birthDateControllerAtom = Atom(
      name: '_InformationViewModelBase.birthDateController', context: context);

  @override
  TextEditingController get birthDateController {
    _$birthDateControllerAtom.reportRead();
    return super.birthDateController;
  }

  @override
  set birthDateController(TextEditingController value) {
    _$birthDateControllerAtom.reportWrite(value, super.birthDateController, () {
      super.birthDateController = value;
    });
  }

  late final _$heightControllerAtom = Atom(
      name: '_InformationViewModelBase.heightController', context: context);

  @override
  TextEditingController get heightController {
    _$heightControllerAtom.reportRead();
    return super.heightController;
  }

  @override
  set heightController(TextEditingController value) {
    _$heightControllerAtom.reportWrite(value, super.heightController, () {
      super.heightController = value;
    });
  }

  late final _$weightControllerAtom = Atom(
      name: '_InformationViewModelBase.weightController', context: context);

  @override
  TextEditingController get weightController {
    _$weightControllerAtom.reportRead();
    return super.weightController;
  }

  @override
  set weightController(TextEditingController value) {
    _$weightControllerAtom.reportWrite(value, super.weightController, () {
      super.weightController = value;
    });
  }

  late final _$_initAsyncAction =
      AsyncAction('_InformationViewModelBase._init', context: context);

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_InformationViewModelBase.selectDate', context: context);

  @override
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) {
    return _$selectDateAsyncAction
        .run(() => super.selectDate(context, controller));
  }

  late final _$pickImageFromGaleryAsyncAction = AsyncAction(
      '_InformationViewModelBase.pickImageFromGalery',
      context: context);

  @override
  Future<dynamic> pickImageFromGalery() {
    return _$pickImageFromGaleryAsyncAction
        .run(() => super.pickImageFromGalery());
  }

  late final _$addInformationAsyncAction =
      AsyncAction('_InformationViewModelBase.addInformation', context: context);

  @override
  Future<void> addInformation() {
    return _$addInformationAsyncAction.run(() => super.addInformation());
  }

  late final _$fetchLatestInformationAsyncAction = AsyncAction(
      '_InformationViewModelBase.fetchLatestInformation',
      context: context);

  @override
  Future<void> fetchLatestInformation() {
    return _$fetchLatestInformationAsyncAction
        .run(() => super.fetchLatestInformation());
  }

  late final _$_InformationViewModelBaseActionController =
      ActionController(name: '_InformationViewModelBase', context: context);

  @override
  void toggleBlur(BuildContext context) {
    final _$actionInfo = _$_InformationViewModelBaseActionController
        .startAction(name: '_InformationViewModelBase.toggleBlur');
    try {
      return super.toggleBlur(context);
    } finally {
      _$_InformationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_InformationViewModelBaseActionController
        .startAction(name: '_InformationViewModelBase.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_InformationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
isBlurred: ${isBlurred},
isButtonVisibleInf: ${isButtonVisibleInf},
infoList: ${infoList},
selectedInformation: ${selectedInformation},
nameController: ${nameController},
birthDateController: ${birthDateController},
heightController: ${heightController},
weightController: ${weightController}
    ''';
  }
}
