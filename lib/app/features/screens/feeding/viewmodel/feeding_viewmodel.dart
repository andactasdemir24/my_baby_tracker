import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';
part 'feeding_viewmodel.g.dart';

class FeedingViewModel = _FeedingViewModelBase with _$FeedingViewModel;

abstract class _FeedingViewModelBase with Store {
  var feedingDatasource = locator.get<FeedingDatasource>();
  var calenderViewModel = locator.get<CalenderViewModel>();

  @observable
  TimeOfDay? time;

  @observable
  TextEditingController amountController = TextEditingController();

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible = false;

  @observable
  bool isBlurred = false;

  @action
  void toggleBlur(BuildContext context) {
    if (!isBlurred) {
      isBlurred = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
        isBlurred = false;
      });
    }
  }

  @action
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time ?? TimeOfDay.now(),
    );
    if (newTime != null) {
      time = newTime;
    }
    changeVisible();
  }

  @action
  void changeVisible() {
    isButtonVisible = time != null && amountController.text.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  void clearTime() {
    time = null;
    amountController.clear();
    noteController.clear();
    changeVisible();
  }

  @action
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const FeedingAlert();
      },
    );
  }

  @action
  Future<void> addFeeding() async {
    var uuid = const Uuid();
    if (time != null) {
      final now = DateTime.now();
      final feedingTime = DateTime(
        now.year,
        now.month,
        now.day,
        time!.hour,
        time!.minute,
      );
      Feeding feedingModel = Feeding(
        id: uuid.v4(),
        time: feedingTime,
        amount: int.parse(amountController.text),
        text: noteController.text,
        createdTime: DateTime.now(),
      );
      await feedingDatasource.add(feedingModel);
    }
  }

  @action
  Future<void> updateFeeding(Feeding feed) async {
    DateTime? updatedTime = feed.time;
    int? updatedAmount = feed.amount;
    String? updatedText = feed.text;

    if (time != null) {
      updatedTime = DateTime(
        feed.time!.year,
        feed.time!.month,
        feed.time!.day,
        time!.hour,
        time!.minute,
      );
    }

    Feeding updatedFeeding = Feeding(
      id: feed.id,
      time: updatedTime,
      amount: updatedAmount,
      text: updatedText,
      createdTime: feed.createdTime,
    );

    await feedingDatasource.update(updatedFeeding);
    await calenderViewModel.refreshFeedingList();
    calenderViewModel.allListItem();
  }
}
