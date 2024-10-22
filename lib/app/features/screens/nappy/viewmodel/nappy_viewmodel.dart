// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_tracker_app/app/app.dart';
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
  ObservableList<NappyModel> selectedIndicess = ObservableList<NappyModel>();

  @observable
  List<NappyModel> nappyStatusList = [];
  //bu fonksiyon ve üstteki bağlantılıdır. Bağlantı işse şudur: normalde alttaki listenin içinde yazanlar yukarıda yazılı oldup normal bir şekilde kullanılabilirdi.
  //fakat localizations işlemi yaptığımda bir context istediği için bende mecbur fonk içine aynı listeyi açıp elemanları yazdım.
  //ve bu fonksiyonu viewda çağırdım. üstttekine gitti veriler
  @action
  void fillList(BuildContext context) {
    nappyStatusList = [
      NappyModel(image: ImagesConst.nappy1, name: AppLocalizations.of(context)!.nappy1Text),
      NappyModel(image: ImagesConst.nappy2, name: AppLocalizations.of(context)!.nappy2Text),
      NappyModel(image: ImagesConst.nappy3, name: AppLocalizations.of(context)!.nappy3Text),
      NappyModel(image: ImagesConst.nappy4, name: AppLocalizations.of(context)!.nappy4Text),
    ];
  }

  @observable
  bool isBlurred = false;

  //edit sayfasında seçmeden geri gelirse değişiklikleri korumak için
  //selectedindicesteki veriler geçici olarak buraya atılıyor eğer değişiklik yapılırsa diye yapılmazsa eskisine föndürmek için
  @observable
  ObservableList<NappyModel> tempSelectedIndices = ObservableList<NappyModel>();

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
    changeVisibleNappy();
  }

  @action
  Future<void> changeVisibleNappy() async {
    isButtonVisible4 = time4 != null && selectedIndicess.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  Future<void> clearTime() async {
    time4 = null;
    noteController.clear();
    selectedIndicess.clear();
    changeVisibleNappy();
  }

  // @action
  // Future<void> toggleSelectedIndex(NappyModel nappyModel) async {
  //   if (selectedIndicess.contains(nappyModel)) {
  //     selectedIndicess.remove(nappyModel);
  //   } else {
  //     if (selectedIndicess.isEmpty) {
  //       selectedIndicess.clear();
  //       selectedIndicess.add(nappyModel);
  //     }
  //   }
  // }

  @action
  Future<void> toggleSelectedIndex(NappyModel nappy) async {
    runInAction(() {
      selectedIndicess.clear();
      selectedIndicess.add(nappy);
    });
  }

  //edit sayfasında seçmeden geri gelirse değişiklikleri korumak için bu 4 fonksiyon
  //selectedindicesteki veriler geçici olarak buraya atılıyor eğer değişiklik yapılırsa diye yapılmazsa eskisine föndürmek için
  @action
  void startSelection() {
    tempSelectedIndices = ObservableList.of(selectedIndicess);
  }

  @action
  void restoreSelection() {
    selectedIndicess = ObservableList.of(tempSelectedIndices);
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
  Future<void> addNappy() async {
    var uuid = const Uuid();
    if (time4 != null) {
      final now = DateTime.now();
      final nappyTime = DateTime(
        now.year,
        now.month,
        now.day,
        time4!.hour,
        time4!.minute,
      );

      // Burada, her bir NappyModel için yeni bir kopya oluşturuyoruz.
      List<NappyModel> newNapList =
          selectedIndicess.map((nappyModel) => NappyModel(image: nappyModel.image, name: nappyModel.name)).toList();

      Nappy nappyModel = Nappy(
        id: uuid.v4(),
        nappyTime: nappyTime,
        napList: newNapList,
        text: noteController.text,
        createdTime: DateTime.now(),
      );

      await nappysDatasource.add(nappyModel);
    }
  }

  @action
  Future<void> updateNappy(Nappy nappy) async {
    DateTime? updatedTime = nappy.nappyTime;
    String? updatedText = nappy.text;

    if (time4 != null) {
      updatedTime = DateTime(
        nappy.nappyTime!.year,
        nappy.nappyTime!.month,
        nappy.nappyTime!.day,
        time4!.hour,
        time4!.minute,
      );
    }

    List<NappyModel> newNapList =
        selectedIndicess.map((nappyModel) => NappyModel(image: nappyModel.image, name: nappyModel.name)).toList();

    Nappy nappyModel = Nappy(
      id: nappy.id,
      nappyTime: updatedTime,
      napList: newNapList,
      text: updatedText,
      createdTime: nappy.createdTime,
    );

    await nappysDatasource.update(nappyModel);
    await calenderViewModel.getNappy(calenderViewModel.selectedDate);
    // await calenderViewModel.refreshNappyList();
    // calenderViewModel.allListItem();
  }
}
