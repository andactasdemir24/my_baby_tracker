import 'dart:io';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/information_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/information_model.dart';
import 'package:baby_tracker_app/app/features/model/information_gender_model_f.dart';
import 'package:baby_tracker_app/app/features/screens/main_navbar/main_navbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  ObservableList<InformationGender> selectedIndices = ObservableList<InformationGender>();

  @observable
  List<InformationGender> genderList = [
    InformationGender(image: girl, name: girlText),
    InformationGender(image: boy, name: boyText),
  ];

  @observable
  bool isSeenInformation = false;

  @observable
  bool isEdit = false;

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
    init();
  }

  @action
  Future<void> init() async {
    //await getInformation();
    await fetchLatestInformation();
  }

  //uygulama açıldığında profile sayfasındaki textfieldların içlerinin dolu olması için
  @action
  void holdTextFieldsData() {
    if (selectedInformation != null) {
      selectedImage = selectedInformation!.image != null ? File(selectedInformation!.image!) : null;
      nameController.text = selectedInformation!.fullname ?? '';
      birthDateController.text = selectedInformation!.birthDate ?? '';
      weightController.text = selectedInformation!.weight?.toString() ?? '';
      heightController.text = selectedInformation!.height?.toString() ?? '';
    }
  }

  @action
  void isEditControl() {
    isEdit = !isEdit;
  }

  @action
  Future<void> saveIsSeenInformation() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('information', true);
  }

  @action
  Future<void> loadIsSeenInformation() async {
    final preferences = await SharedPreferences.getInstance();
    isSeenInformation = preferences.getBool('information') ?? false;
  }

  //butona basınca blur lottiesinin gelmesi
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

  //gender listesindeki elemanın herhangi birine tıklayınca algılaması
  @action
  Future<void> toggleSelectedIndex(InformationGender gender) async {
    runInAction(() {
      if (selectedIndices.contains(gender)) {
        selectedIndices.remove(gender);
      } else {
        if (selectedIndices.length < 1) {
          selectedIndices.add(gender);
        }
      }
    });
  }

  //boş mu dolu mu kontrol
  @action
  void changeVisible() {
    isButtonVisibleInf = selectedImage != null &&
        selectedIndices.isNotEmpty &&
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
      lastDate: DateTime.now(),
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
        image: selectedImage?.path,
        genderList: selectedIndices,
        fullname: nameController.text,
        birthDate: birthDateController.text,
        weight: int.tryParse(weightController.text),
        height: int.tryParse(heightController.text));
    await informationDatasource.add(informationModel);
  }

  // listeye eklenen son veriyi alması
  @action
  Future<void> fetchLatestInformation() async {
    var informationData = await informationDatasource.get();
    if (informationData.success && informationData.data != null) {
      selectedInformation = informationData.data;
      holdTextFieldsData();
    }
  }

  @action
  Future<void> refreshInformationList() async {
    var informationData = await informationDatasource.getAll();
    infoList = informationData.data ?? [];
  }

  @action
  Future<void> updateInformation(Information info) async {
    String? image = info.image;
    String? fullname = info.fullname;
    String? birthDate = info.birthDate;
    int? weight = info.weight;
    int? height = info.height;

    Information informationModel = Information(
        id: info.id,
        image: image,
        genderList: selectedIndices,
        fullname: fullname,
        birthDate: birthDate,
        weight: weight,
        height: height);

    await informationDatasource.update(informationModel);
    await refreshInformationList();
  }
}
