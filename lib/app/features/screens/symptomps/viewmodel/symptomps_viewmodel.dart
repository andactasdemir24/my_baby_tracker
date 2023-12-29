import 'package:baby_tracker_app/app/core/hive/datasource/symptomps_datasource.dart';
import 'package:baby_tracker_app/app/features/model/symptomps_model_f.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/model/symptomps_model.dart';
import '../../calender/viewmodel/calender_viewmodel.dart';
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
  List<SymptopmsModel> symptompsList = [
    SymptopmsModel(image: runnyNose, name: runnyNoseT),
    SymptopmsModel(image: heartburn, name: heartburnT),
    SymptopmsModel(image: noAppetite, name: noAppetiteT),
    SymptopmsModel(image: rush, name: rushT),
    SymptopmsModel(image: lowEnergy, name: lowEnergyT),
    SymptopmsModel(image: nausea, name: nauseaT),
    SymptopmsModel(image: cough, name: coughT),
    SymptopmsModel(image: fever, name: feverT),
  ];

  @observable
  bool isBlurred3 = false;

  @observable
  bool isBlurred4 = false;

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
  }

  @action
  Future<void> changeVisible() async {
    isButtonVisible3 = time3 != null && selectedIndices.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  Future<void> clearTime() async {
    time3 = null;
    noteController.clear();
    changeVisible();
  }

  @action
  Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) async {
    runInAction(() {
      if (selectedIndices.contains(symptopmsModel)) {
        selectedIndices.remove(symptopmsModel);
      } else {
        if (selectedIndices.length < 2) {
          selectedIndices.add(symptopmsModel);
        }
      }
    });
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

      // // sympList için her öğe için yeni bir SymptopmsModel oluşturma
      // var newSympList = selectedIndices
      //     .map((symptopmsModel) => SymptopmsModel(image: symptopmsModel.image, name: symptopmsModel.name))
      //     .toList();

      Symptomps symptompsModel = Symptomps(
        id: uuid.v4(),
        symTime: symptompsTime,
        sympList: selectedIndices,
        text: noteController.text,
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

    Symptomps symptompsModel = Symptomps(
      id: symptomps.id,
      symTime: updatedTime,
      sympList: selectedIndices,
      text: updatedText,
    );

    await symptompsDatasource.update(symptompsModel);
    await calenderViewModel.refreshSymptompsList();
     calenderViewModel.allListItem();
  }
}
