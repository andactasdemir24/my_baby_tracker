import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/getIt/locator.dart';
import '../../calender/viewmodel/calender_viewmodel.dart';
part 'sleep_viewmodel.g.dart';

class SleepViewModel = _SleepViewModelBase with _$SleepViewModel;

abstract class _SleepViewModelBase with Store {
  var sleepDatasource = locator.get<SleepDatasource>();
  var calenderViewModel = locator.get<CalenderViewModel>();

  @observable
  TimeOfDay? time1;

  @observable
  TimeOfDay? time2;

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible2 = false;

  @observable
  bool isBlurred2 = false;

  @action
  void toggleBlur2(BuildContext context) {
    if (!isBlurred2) {
      isBlurred2 = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
        isBlurred2 = false;
      });
    }
  }

  @action
  Future<void> selectTime1(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time1 ?? TimeOfDay.now(),
    );
    if (newTime != null) {
      time1 = newTime;
    }
  }

  @action
  Future<void> selectTime2(BuildContext context) async {
    final TimeOfDay? newTime2 = await showTimePicker(
      context: context,
      initialTime: time2 ?? TimeOfDay.now(),
    );
    if (newTime2 != null) {
      time2 = newTime2;
    }
  }

  @action
  void changeVisible() {
    isButtonVisible2 = time1 != null && time2 != null && noteController.text.isNotEmpty;
  }

  @action
  void clearTime() {
    time1 = null;
    time2 = null;
    noteController.clear();
    changeVisible();
  }

  @action
  Future<void> addSleep() async {
    var uuid = const Uuid();
    if (time1 != null && time2 != null) {
      final now = DateTime.now();
      final sleepTime = DateTime(
        now.year,
        now.month,
        now.day,
        time1!.hour,
        time1!.minute,
      );
      final wokeUp = DateTime(
        now.year,
        now.month,
        now.day,
        time2!.hour,
        time2!.minute,
      );
      Sleep sleepModel = Sleep(
        id: uuid.v4(),
        fellSleep: sleepTime,
        wokeUp: wokeUp,
        text: noteController.text,
      );
      await sleepDatasource.add(sleepModel);
    }
  }

  @action
  Future<void> updateSleep(Sleep sleep) async {
    DateTime? updatedTime = sleep.fellSleep;
    DateTime? updatedTime2 = sleep.wokeUp;
    String? updatedText = sleep.text;

    if (time1 != null) {
      updatedTime = DateTime(
        sleep.fellSleep!.year,
        sleep.fellSleep!.month,
        sleep.fellSleep!.day,
        time1!.hour,
        time1!.minute,
      );
    }
    if (time2 != null) {
      updatedTime2 = DateTime(
        sleep.wokeUp!.year,
        sleep.wokeUp!.month,
        sleep.wokeUp!.day,
        time2!.hour,
        time2!.minute,
      );
    }

    Sleep updateSleep = Sleep(
      id: sleep.id,
      fellSleep: updatedTime,
      wokeUp: updatedTime2,
      text: updatedText,
    );

    await sleepDatasource.update(updateSleep);
    await calenderViewModel.refreshSleepList();
     calenderViewModel.allListItem();
  }
}
