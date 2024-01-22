import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';
part 'memories_viewmodel.g.dart';

class MemoriesViewModel = _MemoriesViewModelBase with _$MemoriesViewModel;

abstract class _MemoriesViewModelBase with Store {
  var memoriesDatasource = locator.get<MemoriesDatasource>();

  @observable
  File? selectedImage;

  @observable
  ObservableList<MemoriesModel> memoriesList = ObservableList<MemoriesModel>();

  @observable
  CarouselController carouselController = CarouselController();

  @observable
  bool isImagePickerActive = false;

  _MemoriesViewModelBase() {
    init();
  }

  @action
  Future<void> init() async {
    await getMemories();
  }

  @action
  Future pickImageFromGallery() async {
    if (isImagePickerActive) return;
    isImagePickerActive = true;
    try {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage != null) {
        selectedImage = File(returnedImage.path);
      }
    } on PlatformException catch (e) {
      Text(e.toString());
    } finally {
      isImagePickerActive = false;
    }
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
  Future<void> showMyDialog(BuildContext context, String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomAlert(id: id);
      },
    );
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

  @action
  Future<void> deleteMemories(String id) async {
    await memoriesDatasource.delete(id);
    memoriesList.removeWhere((feeding) => feeding.id.toString() == id);
  }

  @action
  Future<void> clearAllMemories() async {
    await memoriesDatasource.clear();
    await getMemories();
  }
}
