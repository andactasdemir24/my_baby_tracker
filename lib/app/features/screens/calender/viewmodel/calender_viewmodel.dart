// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/symptomps_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/datasource/feeding_datasource.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewModel = _CalenderViewModelBase with _$CalenderViewModel;

abstract class _CalenderViewModelBase with Store {
  var feedingDatasource = locator.get<FeedingDatasource>();
  var sleepDatasource = locator.get<SleepDatasource>();
  var symptompsDatasource = locator.get<SymptompsDatasource>();

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  List<Feeding> feedingList = [];

  @observable
  List<Sleep> sleepList = [];

  @observable
  List<Symptomps> symptompsList = [];

  @observable
  ObservableList<dynamic> allList = ObservableList<dynamic>();

  @observable
  bool isSelected = false;

  @observable
  ObservableMap<String, ObservableList<dynamic>> groupedItems = ObservableMap<String, ObservableList<dynamic>>();

  _CalenderViewModelBase() {
    init();
  }

  @action
  Future<void> init() async {
    await getFeeding();
    await getSleep();
    await getSymptomps();
    allListItem();
  }

  @action
  void allListItem() {
    allList.clear();
    allList.addAll(feedingList);
    allList.addAll(sleepList);
    allList.addAll(symptompsList);
    groupItemsByType();
  }

  //Calender sayfasında her verinin üstünde modelinin isminin yazması için gereken fonksiyon
  @action
  void groupItemsByType() {
    final newGroupedItems = <String, ObservableList<dynamic>>{};
    for (var all in allList) {
      var type = all.runtimeType.toString();
      newGroupedItems.putIfAbsent(type, () => ObservableList<dynamic>()).add(all);
    }
    groupedItems = ObservableMap<String, ObservableList<dynamic>>.of(newGroupedItems);
  }

  @action
  Future<DateTime?> pickDate(BuildContext context) =>
      showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));

  //ALL FEEDİNG FUNCTİON -------------
  //bastığım indexe göre algılama
  @action
  void toggleSelected(int index) {
    var feeding = feedingList[index];
    var updatedFeeding = feeding.copyWith(isSelected: !feeding.isSelected);
    feedingList = List.from(feedingList)..[index] = updatedFeeding;
  }

  @action
  Future<void> getFeeding() async {
    feedingList.clear();
    var feedingData = await feedingDatasource.getAll();
    feedingList.addAll(feedingData.data!);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> deleteFeeding(String id) async {
    await feedingDatasource.delete(id);
    feedingList.removeWhere((feeding) => feeding.id.toString() == id);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> refreshFeedingList() async {
    var feedingData = await feedingDatasource.getAll();
    feedingList = feedingData.data ?? [];
  }

  //ALL SLEEP FUNCTİON --------
  @action
  void toggleSelected1(int index) {
    var sleep = sleepList[index];
    var updatedSleep = sleep.copyWith(isSelected: !sleep.isSelected);
    sleepList = List.from(sleepList)..[index] = updatedSleep;
  }

  @action
  Future<void> getSleep() async {
    sleepList.clear();
    var sleepData = await sleepDatasource.getAll();
    sleepList.addAll(sleepData.data!);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> deleteSleep(String id) async {
    await sleepDatasource.delete(id);
    sleepList.removeWhere((sleep) => sleep.id.toString() == id);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> refreshSleepList() async {
    var sleepData = await sleepDatasource.getAll();
    sleepList = sleepData.data ?? [];
  }

  //ALL SYMPTOMPS FUNCTİON
  @action
  void toogleSelected2(int index) {
    var symptomps = symptompsList[index];
    var updatedSymptomps = symptomps.copyWith(isSelected: !symptomps.isSelected);
    symptompsList = List.from(symptompsList)..[index] = updatedSymptomps;
  }

  @action
  Future<void> getSymptomps() async {
    symptompsList.clear();
    var symptompsData = await symptompsDatasource.getAll();
    symptompsList.addAll(symptompsData.data!);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> deleteSymptomps(String id) async {
    await symptompsDatasource.delete(id);
    symptompsList.removeWhere((symptomps) => symptomps.id.toString() == id);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> refreshSymptompsList() async {
    var sympData = await symptompsDatasource.getAll();
    symptompsList = sympData.data ?? [];
  }
}
