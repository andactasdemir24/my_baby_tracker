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
      appBar: const CustomAppbar(appbarText: calenderAppbar, centerTitle: true),
      body: Observer(builder: (context) {
        return Column(
          children: [
            DateButton(calenderViewmodel: calenderViewmodel),
            TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              dividerColor: cwhite,
              indicatorColor: buttonColor,
              labelColor: buttonColor,
              tabs: const <Widget>[
                Tab(child: Text('All', style: TextStyle(fontSize: 20))),
                Tab(icon: Icon(Baby.feed, size: 45, color: feedingTab)),
                Tab(icon: Icon(Baby.sleep, size: 45, color: sleepTab)),
                Tab(icon: Icon(Baby.symptoms, size: 45, color: symptompsTab)),
                Tab(icon: Icon(Baby.nappy, size: 45, color: nappyTab)),
                Tab(icon: Icon(Baby.vaccine3, size: 33, color: vaccineTab)),
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
