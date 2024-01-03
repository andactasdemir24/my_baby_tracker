import 'dart:io';
import 'package:baby_tracker_app/app/core/hive/datasource/information_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/information_model.dart';
import 'package:baby_tracker_app/app/features/screens/main_navbar/main_navbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/getIt/locator.dart';

part 'information_viewmodel.g.dart';

class InformationViewModel = _InformationViewModelBase with _$InformationViewModel;

abstract class _InformationViewModelBase with Store {
  var informationDatasource = locator.get<InformationDatasource>();

  @observable
  File? selectedImage;

  @observable
  bool isBlurred = false;

  @observable
  bool isButtonVisibleInf = false;

  @observable
  List<Information> infoList = [];

  @observable
  Information? selectedInformation;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController birthDateController = TextEditingController();

  @observable
  TextEditingController heightController = TextEditingController();

  @observable
  TextEditingController weightController = TextEditingController();

  _InformationViewModelBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    //await getInformation();
    await fetchLatestInformation();
  }

  @action
  void toggleBlur(BuildContext context) {
    if (!isBlurred) {
      isBlurred = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainNavBar(),
            ));
        isBlurred = false;
      });
    }
  }

  @action
  void changeVisible() {
    isButtonVisibleInf = selectedImage != null &&
        nameController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty;
  }

  @action
  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formattedDate = formatter.format(picked);
      controller.text = formattedDate;
    }
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
  Future<void> addInformation() async {
    var uuid = const Uuid();
    Information informationModel = Information(
        id: uuid.v4(),
        fullname: nameController.text,
        image: selectedImage?.path,
        birthDate: birthDateController.text,
        weight: int.tryParse(weightController.text),
        height: int.tryParse(heightController.text));
    await informationDatasource.add(informationModel);
  }

  // @action
  // Future<void> getInformation() async {
  //   infoList.clear();
  //   var informationData = await informationDatasource.getAll();
  //   infoList.addAll(informationData.data!);
  // }

  @action
  Future<void> fetchLatestInformation() async {
    var informationData = await informationDatasource.get();
    if (informationData.success && informationData.data != null) {
      selectedInformation = informationData.data;
    }
  }
}
