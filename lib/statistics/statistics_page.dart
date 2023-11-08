import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/statistics/tabs/first_tab.dart';
import 'package:flutter_responsive_ui/statistics/tabs/second_tab.dart';
import 'package:flutter_responsive_ui/statistics/tabs/third_tab.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../dashboard/constants.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  // @override
  // Widget build(BuildContext context) {
  //   double width = MediaQuery.of(context).size.width;
  //   int axisCount = max(2, width ~/ 210);
  //
  //   List<String> items = [];
  //   for (int i = 0; i < 100; i++) {
  //     items.add('Stat $i');
  //   }
  //   return Container(
  //    // color: Colors.green,
  //     child: StaggeredGridView.countBuilder(
  //       crossAxisCount: axisCount,
  //       itemCount: items.length,
  //       //  padding: const EdgeInsets.symmetric(horizontal: 12),
  //       shrinkWrap: true,
  //       //  mainAxisSpacing: 4.0,
  //       //  crossAxisSpacing: 4.0,
  //       staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
  //       itemBuilder: (context, index) {
  //         return Card(
  //           color: secondaryColor,
  //           elevation: 2,
  //           clipBehavior: Clip.hardEdge,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(4),
  //           ),
  //           child: Container(
  //             width: double.infinity,
  //             height: 100,
  //             padding: const EdgeInsets.symmetric(horizontal: 8),
  //             alignment: Alignment.center,
  //             child: Text(
  //               items[index],
  //               style: Theme.of(context).textTheme.subtitle2,
  //               maxLines: 2,
  //               overflow: TextOverflow.ellipsis,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Tabs"),
      ),
      body: isTab(context)
          ? Container(
        margin: EdgeInsets.only(left: 4, right: 4, top: 8),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      text: "FIRST",
                    ),
                  ),
                  Expanded(child: FirstTab()),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      text: "SECOND",
                    ),
                  ),
                  Expanded(child: SecondTab()),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      text: "THIRD",
                    ),
                  ),
                  Expanded(child: ThirdTab()),
                ],
              ),
            ),
          ],
        ),
      )
          : DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              child: TabBar(
                isScrollable: true,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    text: "FIRST",
                  ),
                  Tab(
                    text: "SECOND",
                  ),
                  Tab(
                    text: "THIRD",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isTab(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.width;
    return shortestSide >= 600;
  }
}
