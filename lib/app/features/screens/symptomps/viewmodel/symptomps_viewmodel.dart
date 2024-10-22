// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';
part 'symptomps_viewmodel.g.dart';

class SymptompsViewmodel = _SymptompsViewmodelBase with _$SymptompsViewmodel;

abstract class _SymptompsViewmodelBase with Store {
  var symptompsDatasource = locator.get<SymptompsDatasource>();
  var calenderViewModel = locator.get<CalenderViewModel>();

  @observable
  TimeOfDay? time3;

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible3 = false;

  @observable
  ObservableList<SymptopmsModel> selectedIndices = ObservableList<SymptopmsModel>();

  @observable
  List<SymptopmsModel> symptompsList = [];
  //bu fonksiyon ve üstteki bağlantılıdır. Bağlantı işse şudur: normalde alttaki listenin içinde yazanlar yukarıda yazılı oldup normal bir şekilde kullanılabilirdi.
  //fakat localizations işlemi yaptığımda bir context istediği için bende mecbur fonk içine aynı listeyi açıp elemanları yazdım.
  //ve bu fonksiyonu viewda çağırdım. üstttekine gitti veriler
  @action
  void fillList(BuildContext context) {
    symptompsList = [
      SymptopmsModel(image: ImagesConst.runnyNose, name: AppLocalizations.of(context)!.runnyNoseT),
      SymptopmsModel(image: ImagesConst.heartburn, name: AppLocalizations.of(context)!.heartburnT),
      SymptopmsModel(image: ImagesConst.noAppetite, name: AppLocalizations.of(context)!.noAppetiteT),
      SymptopmsModel(image: ImagesConst.rush, name: AppLocalizations.of(context)!.rushT),
      SymptopmsModel(image: ImagesConst.lowEnergy, name: AppLocalizations.of(context)!.lowEnergyT),
      SymptopmsModel(image: ImagesConst.nausea, name: AppLocalizations.of(context)!.nauseaT),
      SymptopmsModel(image: ImagesConst.cough, name: AppLocalizations.of(context)!.coughT),
      SymptopmsModel(image: ImagesConst.fever, name: AppLocalizations.of(context)!.feverT),
    ];
  }

  @observable
  bool isBlurred3 = false;

  @observable
  bool isBlurred4 = false;

  //edit sayfasında seçmeden geri gelirse değişiklikleri korumak için
  @observable
  ObservableList<SymptopmsModel> tempSelectedIndices = ObservableList<SymptopmsModel>();

  @action
  void toggleBlur3(BuildContext context) {
    if (!isBlurred3) {
      isBlurred3 = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
        isBlurred3 = false;
      });
    }
  }

  @action
  void toggleBlur4(BuildContext context) {
    if (!isBlurred4) {
      isBlurred4 = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
        isBlurred4 = false;
      });
    }
  }

  @action
  Future<void> selectTime3(BuildContext context) async {
    final TimeOfDay? newTime3 = await showTimePicker(
      context: context,
      initialTime: time3 ?? TimeOfDay.now(),
    );
    if (newTime3 != null) {
      time3 = newTime3;
    }
    changeVisible();
  }

  @action
  Future<void> changeVisible() async {
    isButtonVisible3 = time3 != null && selectedIndices.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  Future<void> clearTime() async {
    time3 = null;
    noteController.clear();
    selectedIndices.clear();
    changeVisible();
  }

  // @action
  // Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) async {
  //   runInAction(() {
  //     if (selectedIndices.contains(symptopmsModel)) {
  //       selectedIndices.remove(symptopmsModel);
  //     } else {
  //       if (selectedIndices.length < 2) {
  //         selectedIndices.add(symptopmsModel);
  //       }
  //     }
  //     changeVisible();
  //   });
  // }

  @action
  Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) async {
    runInAction(() {
      int selectedIndex = selectedIndices.indexWhere((item) => item.name == symptopmsModel.name);

      if (selectedIndex == -1) {
        // Eğer öğe listede yoksa ve liste zaten iki öğe içermiyorsa, yeni öğeyi ekle
        if (selectedIndices.length < 2) {
          selectedIndices.add(symptopmsModel);
        }
        // Eğer liste zaten iki öğe içeriyorsa, ilk öğeyi kaldır ve yeni öğeyi ekle
        else {
          selectedIndices.removeAt(0);
          selectedIndices.add(symptopmsModel);
        }
      } else {
        // Eğer öğe zaten listedeyse, öğeyi listeden kaldır
        selectedIndices.removeAt(selectedIndex);
      }

      changeVisible();
    });
  }

  // @action
  // Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) async {
  //   runInAction(() {
  //     selectedIndices.clear();
  //     selectedIndices.add(symptopmsModel);
  //     changeVisible();
  //   });
  // }

  //edit sayfasında seçmeden geri gelirse değişiklikleri korumak için bu 4 fonksiyon
  @action
  void startSelection() {
    tempSelectedIndices = ObservableList.of(selectedIndices);
  }

  @action
  void restoreSelection() {
    selectedIndices = ObservableList.of(tempSelectedIndices);
  }

  @action
  void onBack() {
    restoreSelection();
  }

  @action
  void onSave() {
    tempSelectedIndices.clear();
  }

  @action
  Future<void> addSymptomps() async {
    var uuid = const Uuid();
    if (time3 != null) {
      final now = DateTime.now();
      final symptompsTime = DateTime(
        now.year,
        now.month,
        now.day,
        time3!.hour,
        time3!.minute,
      );

      List<SymptopmsModel> newSymptmpsList = selectedIndices
          .map((symptopmsModel) => SymptopmsModel(image: symptopmsModel.image, name: symptopmsModel.name))
          .toList();

      Symptomps symptompsModel = Symptomps(
        id: uuid.v4(),
        symTime: symptompsTime,
        sympList: newSymptmpsList,
        text: noteController.text,
        createdTime: DateTime.now(),
      );
      await symptompsDatasource.add(symptompsModel);
    }
  }

  @action
  Future<void> updateSymptomps(Symptomps symptomps) async {
    DateTime? updatedTime = symptomps.symTime;
    String? updatedText = symptomps.text;

    if (time3 != null) {
      updatedTime = DateTime(
        symptomps.symTime!.year,
        symptomps.symTime!.month,
        symptomps.symTime!.day,
        time3!.hour,
        time3!.minute,
      );
    }
    List<SymptopmsModel> newSymptmpsList = selectedIndices
        .map((symptopmsModel) => SymptopmsModel(image: symptopmsModel.image, name: symptopmsModel.name))
        .toList();

    Symptomps symptompsModel = Symptomps(
      id: symptomps.id,
      symTime: updatedTime,
      sympList: newSymptmpsList,
      text: updatedText,
      createdTime: symptomps.createdTime,
    );

    await symptompsDatasource.update(symptompsModel);
    await calenderViewModel.getSymptomps(calenderViewModel.selectedDate);
    // await calenderViewModel.refreshSymptompsList();
    // calenderViewModel.allListItem();
  }
}
