// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';

part 'vaccine_viewmodel.g.dart';

class VaccineViewModel = _VaccineViewModelBase with _$VaccineViewModel;

abstract class _VaccineViewModelBase with Store {
  var vaccineDatasource = locator.get<VaccineDatasource>();
  var calenderViewModel = locator.get<CalenderViewModel>();

  @observable
  String? dropdownValue;

  @observable
  TextEditingController dateController = TextEditingController();

  @observable
  TextEditingController vaccineController = TextEditingController();

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible = false;

  @observable
  bool isBlurred = false;

  @observable
  List<String> list = [];

  //bu fonksiyon ve üstteki bağlantılıdır. Bağlantı işse şudur: normalde alttaki listenin içinde yazanlar yukarıda yazılı oldup normal bir şekilde kullanılabilirdi.
  //fakat localizations işlemi yaptığımda bir context istediği için bende mecbur fonk içine aynı listeyi açıp elemanları yazdım.
  //ve bu fonksiyonu viewda çağırdım. üstttekine gitti veriler
  @action
  void fillList(BuildContext context) {
    list = [
      AppLocalizations.of(context)!.vaccine1,
      AppLocalizations.of(context)!.vaccine2,
      AppLocalizations.of(context)!.vaccine3,
      AppLocalizations.of(context)!.vaccine4,
      AppLocalizations.of(context)!.vaccine5,
      AppLocalizations.of(context)!.vaccine6,
      AppLocalizations.of(context)!.vaccine7,
      AppLocalizations.of(context)!.vaccine8,
      AppLocalizations.of(context)!.vaccine9,
    ];
  }

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
    changeVisible();
  }

  @action
  void changeVisible() {
    isButtonVisible =
        dateController.text.isNotEmpty && vaccineController.text.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  void clearTime() {
    dateController.clear();
    vaccineController.clear();
    noteController.clear();
    changeVisible();
  }

  @action
  Future<void> addVaccine() async {
    var uuid = const Uuid();

    Vaccine vaccineModel = Vaccine(
      id: uuid.v4(),
      date: dateController.text,
      vaccine: vaccineController.text,
      text: noteController.text,
      createdTime: DateTime.now(),
    );
    await vaccineDatasource.add(vaccineModel);
  }

  @action
  Future<void> updateVaccine(Vaccine vaccine) async {
    Vaccine vaccineModel = Vaccine(
        id: vaccine.id,
        date: vaccine.date,
        vaccine: vaccine.vaccine,
        text: vaccine.text,
        createdTime: vaccine.createdTime);

    await vaccineDatasource.update(vaccineModel);
    await calenderViewModel.getVaccine(calenderViewModel.selectedDate);
    // await calenderViewModel.refreshVaccineList();
    // calenderViewModel.allListItem();
  }
}
