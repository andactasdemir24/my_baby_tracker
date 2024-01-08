import 'dart:io';

import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/memories_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/memories_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'memories_viewmodel.g.dart';

class MemoriesViewModel = _MemoriesViewModelBase with _$MemoriesViewModel;

abstract class _MemoriesViewModelBase with Store {
  var memoriesDatasource = locator.get<MemoriesDatasource>();

  @observable
  File? selectedImage;

  @observable
  ObservableList<MemoriesModel> memoriesList = ObservableList<MemoriesModel>();

  _MemoriesViewModelBase() {
    init();
  }

  @action
  Future<void> init() async {
    await getMemories();
  }

  @action
  Future pickImageFromGalery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    selectedImage = File(returnedImage.path);
  }

  @action
  Future pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) {
      return;
    }
    selectedImage = File(returnedImage.path);
  }

  @action
  Future<void> addMemories() async {
    //picker açıldığında seçmezse en son seçili olanı eklemesin diye direkt return yaptım
    if (selectedImage == null) {
      return;
    }

    var uuid = const Uuid();
    MemoriesModel memoriesModel = MemoriesModel(id: uuid.v4(), image: selectedImage?.path);
    await memoriesDatasource.add(memoriesModel);
    await getMemories();

    //burada da selected image yi sıfırlıyorum ki eskisini eklemesin
    selectedImage = null;
  }

  @action
  Future<void> getMemories() async {
    var memoriesData = await memoriesDatasource.getAll();
    memoriesList.clear();
    memoriesList.addAll(memoriesData.data!);
  }
}
