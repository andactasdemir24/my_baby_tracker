import 'package:baby_tracker_app/app/app.dart';
import 'package:baby_tracker_app/app/features/screens/memories/widgets/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemoriesPage extends StatelessWidget {
  const MemoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return Scaffold(
        appBar: CustomAppbar(
          appbarText: AppLocalizations.of(context)!.memoriesAppbarText,
          centerTitle: false,
          actions: [CustomDeleteAllButton(memoriesViewmodel: memoriesViewmodel)],
        ),
        backgroundColor: shade100,
        body: Observer(builder: (context) {
          if (memoriesViewmodel.memoriesList.isNotEmpty) {
            return SingleChildScrollView(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 15.h,
                ),
                shrinkWrap: true,
                itemCount: memoriesViewmodel.memoriesList.length,
                itemBuilder: (BuildContext context, index) {
                  var memories = memoriesViewmodel.memoriesList[index];
                  return CustomImageContainerMemories(memories: memories);
                },
              ),
            );
          } else {
            return CustomNoDataWidget(image: noDataImage2, text: AppLocalizations.of(context)!.noDataText);
          }
        }),
        floatingActionButton: CustomFloatActionButton(memoriesViewmodel: memoriesViewmodel));
  }
}
