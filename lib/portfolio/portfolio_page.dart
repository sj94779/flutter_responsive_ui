import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/portfolio/page_list.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    for (int i = 0; i < 100; i++) {
      items.add('Contact $i');
    }
    return
      const ResponsiveBreakpoints(breakpoints: [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ], child: ListPage());
    //   Container(
    //   color: Colors.yellow,
    //   child: ListView.builder(
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(items[index]),
    //       );
    //     },
    //   ),
    // );
  }
}
