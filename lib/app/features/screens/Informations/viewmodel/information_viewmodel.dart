// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';
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
  List<InformationGender> genderList = [];
  //bu fonksiyon ve üstteki bağlantılıdır. Bağlantı işse şudur: normalde alttaki listenin içinde yazanlar yukarıda yazılı oldup normal bir şekilde kullanılabilirdi.
  //fakat localizations işlemi yaptığımda bir context istediği için bende mecbur fonk içine aynı listeyi açıp elemanları yazdım.
  //ve bu fonksiyonu viewda çağırdım. üstttekine gitti veriler
  @action
  void fillList(BuildContext context) {
    genderList = [
      InformationGender(image: ImagesConst.girl, name: AppLocalizations.of(context)!.girlText),
      InformationGender(image: ImagesConst.boy, name: AppLocalizations.of(context)!.boyText),
    ];
  }

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

  //Profile Alanındaki textfieldlar boş kaldığında snacbar çıkması için değer
  @computed
  bool get areFieldsFilled {
    return nameController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty;
  }

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
  Future<void> saveIsSeenInformationFalse() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('information', false);
  }

  @action
  Future<void> loadIsSeenInformation() async {
    final preferences = await SharedPreferences.getInstance();
    isSeenInformation = preferences.getBool('information') ?? false;
  }

  //mail göndermek için
  @action
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
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

  @action
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CustomInformationAlert();
      },
    );
  }

  //gender listesindeki elemanın herhangi birine tıklayınca algılaması
  @action
  Future<void> toggleSelectedIndex(InformationGender gender) async {
    runInAction(() {
      selectedIndices.clear();
      selectedIndices.add(gender);
      selectedInformation?.selectedGender = gender.name;
    });
  }

  //boş mu dolu mu kontrol
  @action
  void changeVisible() {
    isButtonVisibleInf = selectedIndices.isNotEmpty &&
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
      final DateFormat formatter = DateFormat('dd.MM.yyyy');
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
    changeVisible();
  }

  @action
  Future<void> addInformation() async {
    var uuid = const Uuid();

    String? genderName = selectedIndices.isNotEmpty ? selectedIndices.first.name : null;

    Information informationModel = Information(
        id: uuid.v4(),
        image: selectedImage?.path,
        genderList: selectedIndices,
        fullname: nameController.text,
        birthDate: birthDateController.text,
        weight: int.tryParse(weightController.text),
        height: int.tryParse(heightController.text),
        selectedGender: genderName);

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
    if (!areFieldsFilled) {
      //textfieldlar Boşşa güncelleme
      return;
    }
    Information informationModel = Information(
      id: info.id,
      image: info.image,
      genderList: selectedIndices,
      fullname: info.fullname,
      birthDate: info.birthDate,
      weight: info.weight,
      height: info.height,
      selectedGender: selectedInformation?.selectedGender,
    );

    await informationDatasource.update(informationModel);
    await refreshInformationList();
  }

  @action
  Future<void> resetState() async {
    selectedImage = null;
    isBlurred = false;
    isButtonVisibleInf = false;
    infoList.clear();
    selectedIndices.clear();
    isSeenInformation = false;
    isEdit = false;
    selectedInformation = null;
    nameController.text = '';
    birthDateController.text = '';
    heightController.text = '';
    weightController.text = '';
  }

  @action
  Future<void> clearBaby() async {
    await informationDatasource.clear();
    await resetState();
  }
}
