// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memories_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemoriesViewModel on _MemoriesViewModelBase, Store {
  late final _$selectedImageAtom =
      Atom(name: '_MemoriesViewModelBase.selectedImage', context: context);

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

  late final _$memoriesListAtom =
      Atom(name: '_MemoriesViewModelBase.memoriesList', context: context);

  @override
  ObservableList<MemoriesModel> get memoriesList {
    _$memoriesListAtom.reportRead();
    return super.memoriesList;
  }

  @override
  set memoriesList(ObservableList<MemoriesModel> value) {
    _$memoriesListAtom.reportWrite(value, super.memoriesList, () {
      super.memoriesList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_MemoriesViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$pickImageFromGaleryAsyncAction = AsyncAction(
      '_MemoriesViewModelBase.pickImageFromGalery',
      context: context);

  @override
  Future<dynamic> pickImageFromGalery() {
    return _$pickImageFromGaleryAsyncAction
        .run(() => super.pickImageFromGalery());
  }

  late final _$pickImageFromCameraAsyncAction = AsyncAction(
      '_MemoriesViewModelBase.pickImageFromCamera',
      context: context);

  @override
  Future<dynamic> pickImageFromCamera() {
    return _$pickImageFromCameraAsyncAction
        .run(() => super.pickImageFromCamera());
  }

  late final _$showMyDialogAsyncAction =
      AsyncAction('_MemoriesViewModelBase.showMyDialog', context: context);

  @override
  Future<void> showMyDialog(BuildContext context, String id) {
    return _$showMyDialogAsyncAction.run(() => super.showMyDialog(context, id));
  }

  late final _$addMemoriesAsyncAction =
      AsyncAction('_MemoriesViewModelBase.addMemories', context: context);

  @override
  Future<void> addMemories() {
    return _$addMemoriesAsyncAction.run(() => super.addMemories());
  }

  late final _$getMemoriesAsyncAction =
      AsyncAction('_MemoriesViewModelBase.getMemories', context: context);

  @override
  Future<void> getMemories() {
    return _$getMemoriesAsyncAction.run(() => super.getMemories());
  }

  late final _$deleteMemoriesAsyncAction =
      AsyncAction('_MemoriesViewModelBase.deleteMemories', context: context);

  @override
  Future<void> deleteMemories(String id) {
    return _$deleteMemoriesAsyncAction.run(() => super.deleteMemories(id));
  }

  late final _$clearAllMemoriesAsyncAction =
      AsyncAction('_MemoriesViewModelBase.clearAllMemories', context: context);

  @override
  Future<void> clearAllMemories() {
    return _$clearAllMemoriesAsyncAction.run(() => super.clearAllMemories());
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
memoriesList: ${memoriesList}
    ''';
  }
}
