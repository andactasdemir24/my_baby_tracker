import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/nappy_datasource.dart';
import 'package:baby_tracker_app/app/features/model/nappy_model_f.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/model/nappy_model.dart';
import '../../calender/viewmodel/calender_viewmodel.dart';
part 'nappy_viewmodel.g.dart';

class NappyViewModel = _NappyViewModelBase with _$NappyViewModel;

abstract class _NappyViewModelBase with Store {
  var nappysDatasource = locator.get<NappyDatasource>();
  var calenderViewModel = locator.get<CalenderViewModel>();

  @observable
  TimeOfDay? time4;

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible4 = false;

  @observable
  ObservableList<NappyModel> selectedIndices = ObservableList<NappyModel>();

  @observable
  List<NappyModel> nappyStatusList = [
    NappyModel(image: nappy1, name: nappy1Text),
    NappyModel(image: nappy2, name: nappy2Text),
    NappyModel(image: nappy3, name: nappy3Text),
    NappyModel(image: nappy4, name: nappy4Text),
  ];

  @observable
  bool isBlurred = false;

  @action
  void toggleBlur5(BuildContext context) {
    if (!isBlurred) {
      isBlurred = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
        isBlurred = false;
      });
    }
  }

  @action
  Future<void> selectTime4(BuildContext context) async {
    final TimeOfDay? newTime4 = await showTimePicker(
      context: context,
      initialTime: time4 ?? TimeOfDay.now(),
    );
    if (newTime4 != null) {
      time4 = newTime4;
    }
  }

  @action
  Future<void> changeVisibleNappy() async {
    isButtonVisible4 = time4 != null && selectedIndices.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  Future<void> clearTime() async {
    time4 = null;
    noteController.clear();
    selectedIndices.clear();
    changeVisibleNappy();
  }

  @action
  Future<void> toggleSelectedIndex(NappyModel nappyModel) async {
    runInAction(() {
      if (selectedIndices.contains(nappyModel)) {
        selectedIndices.clear();
      } else {
        selectedIndices.clear();
        selectedIndices.add(nappyModel);
      }
    });
  }

  @action
  Future<void> addNappy() async {
    var uuid = const Uuid();
    if (time4 != null) {
      final now = DateTime.now();
      final nappyTime = DateTime(now.year, now.month, now.day, time4!.hour, time4!.minute);

      Nappy nappyModel = Nappy(
        id: uuid.v4(),
        nappyTime: nappyTime,
        nappyList: selectedIndices,
        text: noteController.text,
      );
      await nappysDatasource.add(nappyModel);
    }
  }
}
