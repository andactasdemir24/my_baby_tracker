import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/features/screens/memories/viewmodel/memories_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/memories/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/custom_delete_all_button.dart';
import '../widgets/custom_image_container.dart';

class MemoriesPage extends StatelessWidget {
  const MemoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return Scaffold(
        appBar: CustomAppbar(
          appbarText: memoriesAppbarText,
          centerTitle: false,
          actions: [
            CustomDeleteAllButton(memoriesViewmodel: memoriesViewmodel),
          ],
        ),
        backgroundColor: shade100,
        body: Observer(builder: (context) {
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
                return CustomImageContainer(memories: memories);
              },
            ),
          );
        }),
        floatingActionButton: CustomFloatActionButton(memoriesViewmodel: memoriesViewmodel));
  }
}
