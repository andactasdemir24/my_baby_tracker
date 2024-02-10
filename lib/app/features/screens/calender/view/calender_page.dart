import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final calenderViewmodel = locator.get<CalenderViewModel>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    calenderViewmodel.updateDataForSelectedDate();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.calenderAppbar, centerTitle: true),
      body: Observer(builder: (context) {
        return Column(
          children: [
            DateButton(calenderViewmodel: calenderViewmodel),
            TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              dividerColor: ColorConst.cwhite,
              indicatorColor: ColorConst.buttonColor,
              labelColor: ColorConst.buttonColor,
              tabs: <Widget>[
                Tab(child: Text(AppLocalizations.of(context)!.all, style: TextStyle(fontSize: 20.spMin))),
                Tab(icon: Icon(Baby.feed, size: 46.spMin, color: ColorConst.feedingTab)),
                Tab(icon: Icon(Baby.sleep, size: 46.spMin, color: ColorConst.sleepTab)),
                Tab(icon: Icon(Baby.symptoms, size: 46.spMin, color: ColorConst.symptompsTab)),
                Tab(icon: Icon(Baby.nappy, size: 46.spMin, color: ColorConst.nappyTab)),
                Tab(icon: Icon(Baby.syringe2, size: 44.spMin, color: ColorConst.vaccineTab)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  KeyedSubtree(
                    key: ValueKey('all-${calenderViewmodel.selectedDate}'),
                    child: const CustomAllListview(),
                  ),
                  KeyedSubtree(
                    key: ValueKey('feeding-${calenderViewmodel.selectedDate}'),
                    child: const CustomFeedigListView(),
                  ),
                  KeyedSubtree(
                    key: ValueKey('sleep-${calenderViewmodel.selectedDate}'),
                    child: const CustomSleepListView(),
                  ),
                  KeyedSubtree(
                    key: ValueKey('symptomps-${calenderViewmodel.selectedDate}'),
                    child: const CustomSymptompsListView(),
                  ),
                  KeyedSubtree(
                    key: ValueKey('nappy-${calenderViewmodel.selectedDate}'),
                    child: const CustomNappyListView(),
                  ),
                  KeyedSubtree(
                    key: ValueKey('vaccine-${calenderViewmodel.selectedDate}'),
                    child: const CustomVaccineListView(),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
