// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:baby_tracker_app/app/core/hive/datasource/nappy_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/symptomps_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/vaccine_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/vaccine_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/datasource/feeding_datasource.dart';
import '../../../../core/hive/model/nappy_model.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewModel = _CalenderViewModelBase with _$CalenderViewModel;

abstract class _CalenderViewModelBase with Store {
  var feedingDatasource = locator.get<FeedingDatasource>();
  var sleepDatasource = locator.get<SleepDatasource>();
  var symptompsDatasource = locator.get<SymptompsDatasource>();
  var nappyDatasource = locator.get<NappyDatasource>();
  var vaccineDatasource = locator.get<VaccineDatasource>();

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  List<Feeding> feedingList = [];

  @observable
  List<Sleep> sleepList = [];

  @observable
  List<Symptomps> symptompsList = [];

  @observable
  List<Nappy> nappyList = [];

  @observable
  List<Vaccine> vaccineList = [];

  @observable
  ObservableList<dynamic> allList = ObservableList<dynamic>();

  @observable
  bool isSelected = false;

  @observable
  ObservableMap<String, ObservableList<dynamic>> groupedItems = ObservableMap<String, ObservableList<dynamic>>();

  _CalenderViewModelBase() {
    init();
  }


  //günümüz tarihinde başlaması için
  @action
  Future<void> init() async {
    DateTime today = DateTime.now();
    await getFeeding(today);
    await getSleep(today);
    await getSymptomps(today);
    await getNappy(today);
    await getVaccine(today);
    allListItem();
  }

  // tarihe göre veri getirmek gerekmezse
  // @action
  // Future<void> init() async {
  //   await getFeeding();
  //   await getSleep();
  //   await getSymptomps();
  //   await getNappy();
  //   await getVaccine();
  //   allListItem();
  // }

  @action
  void allListItem() {
    allList.clear();
    allList.addAll(feedingList);
    allList.addAll(sleepList);
    allList.addAll(symptompsList);
    allList.addAll(nappyList);
    allList.addAll(vaccineList);
    groupItemsByType();
  }

  //seçtiğim tarihe gitmesi için
  @action
  void setSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    updateDataForSelectedDate();
  }

  //o tarihteki verileri göstermesi için
  @action
  Future<void> updateDataForSelectedDate() async {
    await getFeeding(selectedDate);
    await getSleep(selectedDate);
    await getSymptomps(selectedDate);
    await getNappy(selectedDate);
    await getVaccine(selectedDate);
    allListItem();
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
  Future<void> getFeeding([DateTime? selectedDate]) async {
    feedingList.clear();
    var feedingData = await feedingDatasource.getAll();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day); // Yalnızca tarihi alın

    if (selectedDate != null) {
      feedingList.addAll(feedingData.data!.where((feeding) {
        return isSameDay(feeding.createdTime!, selectedDate);
      }));
    } else {
      feedingList.addAll(feedingData.data!.where((feeding) {
        return isSameDay(feeding.createdTime!, today);
      }));
    }
    allListItem();
    groupItemsByType();
  }

  //basic fonksiyon
  // @action
  // Future<void> getFeeding() async {
  //   feedingList.clear();
  //   var feedingData = await feedingDatasource.getAll();
  //   feedingList.addAll(feedingData.data!);
  //   allListItem();
  //   groupItemsByType();
  // }

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
  Future<void> getSleep([DateTime? selectedDate]) async {
    sleepList.clear();
    var sleepData = await sleepDatasource.getAll();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    if (selectedDate != null) {
      sleepList.addAll(sleepData.data!.where((sleep) {
        return isSameDay(sleep.createdTime!, selectedDate);
      }));
    } else {
      sleepList.addAll(sleepData.data!.where((sleep) {
        return isSameDay(sleep.createdTime!, today);
      }));
    }
    allListItem();
    groupItemsByType();
  }

  // @action
  // Future<void> getSleep() async {
  //   sleepList.clear();
  //   var sleepData = await sleepDatasource.getAll();
  //   sleepList.addAll(sleepData.data!);
  //   allListItem();
  //   groupItemsByType();
  // }

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
  Future<void> getSymptomps([DateTime? selectedDate]) async {
    symptompsList.clear();
    var sympData = await symptompsDatasource.getAll();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    if (selectedDate != null) {
      symptompsList.addAll(sympData.data!.where((symp) {
        return isSameDay(symp.createdTime!, selectedDate);
      }));
    } else {
      symptompsList.addAll(sympData.data!.where((symp) {
        return isSameDay(symp.createdTime!, today);
      }));
    }
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

  //ALL NAPPY FUNCTİON
  @action
  void toogleSelected3(int index) {
    var nappy = nappyList[index];
    var updatedNappy = nappy.copyWith(isSelected: !nappy.isSelected);
    nappyList = List.from(nappyList)..[index] = updatedNappy;
  }

  @action
  Future<void> getNappy([DateTime? selectedDate]) async {
    nappyList.clear();
    var nappyData = await nappyDatasource.getAll();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    if (selectedDate != null) {
      nappyList.addAll(nappyData.data!.where((nappy) {
        return isSameDay(nappy.createdTime!, selectedDate);
      }));
    } else {
      nappyList.addAll(nappyData.data!.where((nappy) {
        return isSameDay(nappy.createdTime!, today);
      }));
    }
    allListItem();
    groupItemsByType();
  }
  // @action
  // Future<void> getNappy() async {
  //   nappyList.clear();
  //   var nappyData = await nappyDatasource.getAll();
  //   nappyList.addAll(nappyData.data!);
  //   allListItem();
  //   groupItemsByType();
  // }

  @action
  Future<void> deleteNappy(String id) async {
    await nappyDatasource.delete(id);
    nappyList.removeWhere((nappy) => nappy.id.toString() == id);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> refreshNappyList() async {
    var nappyData = await nappyDatasource.getAll();
    nappyList = nappyData.data ?? [];
  }

  //All VACCİNE FUNCTİON
  @action
  void toggleSelected4(int index) {
    var vaccine = vaccineList[index];
    var updatedVaccine = vaccine.copyWith(isSelected: !vaccine.isSelected);
    vaccineList = List.from(vaccineList)..[index] = updatedVaccine;
  }

  @action
  Future<void> getVaccine([DateTime? selectedDate]) async {
    vaccineList.clear();
    var vaccineData = await vaccineDatasource.getAll();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    if (selectedDate != null) {
      vaccineList.addAll(vaccineData.data!.where((vaccine) {
        return isSameDay(vaccine.createdTime!, selectedDate);
      }));
    } else {
      vaccineList.addAll(vaccineData.data!.where((vaccine) {
        return isSameDay(vaccine.createdTime!, today);
      }));
    }
    allListItem();
    groupItemsByType();
  }

  // @action
  // Future<void> getVaccine() async {
  //   vaccineList.clear();
  //   var vaccineData = await vaccineDatasource.getAll();
  //   vaccineList.addAll(vaccineData.data!);
  //   allListItem();
  //   groupItemsByType();
  // }

  @action
  Future<void> deleteVaccine(String id) async {
    await vaccineDatasource.delete(id);
    vaccineList.removeWhere((feeding) => feeding.id.toString() == id);
    allListItem();
    groupItemsByType();
  }

  @action
  Future<void> refreshVaccineList() async {
    var vaccineData = await vaccineDatasource.getAll();
    vaccineList = vaccineData.data ?? [];
  }

  // Tarihleri karşılaştırmak için yardımcı fonksiyon
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
