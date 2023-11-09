import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/portfolio/portfolio_page.dart';
import 'package:flutter_responsive_ui/blogs/blog_page.dart';
import 'package:flutter_responsive_ui/statistics/statistics_page.dart';
import 'adaptive_scaffold.dart';
import 'dashboard/dashboard_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String title = "board";
  Color? leadingIconColor = Colors.deepPurple[400];
  bool expand = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: selectedIndex,
      onSelectionChanged: (index) {
        onBottomNavigationChanged(index);
      },
      expanded: expand,
      onExpandChanged: (expand) {
        onExpandChanged(expand);
      },
      appBar: getAppBar(context,
          leadingWidth: kIsWeb ? 100 : null,
          autoLeading: false,
          title: title,
          leadingIconColor: leadingIconColor,
          showBack: false,
          leading: leadingItem(),
          actions: actionItems()),
      body: getWidget(selectedIndex),
      tabs: [
        TabItem(
          title: "board",
          icon: Icons.home_outlined,
          activeIcon: Icons.home_rounded,
        ),
        TabItem(
          title: "Portfolio",
          icon: Icons.supervisor_account_outlined,
          activeIcon: Icons.supervisor_account_rounded,
        ),
        TabItem(
          title: "Statistics",
          icon: Icons.photo_library_outlined,
          activeIcon: Icons.photo_library_rounded,
        ),
        TabItem(
          title: "Blogs",
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings_rounded,
        ),
      ],
    );
  }

  Widget getWidget(int position) {
    switch (position) {
      case 0:

        return DashboardScreen();

      case 1:
        return const PortfolioPage();

      case 2:
        return const StatisticsPage();

      case 3:
        return const BlogPage();

      default:
        return Container();
    }
  }

  AppBar getAppBar(BuildContext context,
      {String title = "",
      Color? leadingIconColor = Colors.blue,
      Widget? leading,
      double? leadingWidth,
      List<Widget>? actions,
      double elevation = 0,
      bool showBack = true,
      bool autoLeading = true,
      bool allowTap = false,
      bool centerTitle = true,
      VoidCallback? function}) {
    AppBar appBar = AppBar(
      leadingWidth: leadingWidth,
      bottomOpacity: 0.0,
      actions: actions,
      titleSpacing: autoLeading ? 0 : 24,
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: autoLeading,
      iconTheme: IconThemeData(
        color: Theme.of(context)
            .textTheme
            .bodyText1!
            .color, //change your color here
      ),
      title: selectedIndex != 0
          ? Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 19,
              ),
            )
          : const Text(''),
      leading: showBack
          ? IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 24,
              ),
              onPressed:
                  allowTap ? function : () => Navigator.of(context).pop(),
            )
          : leading,
    );

    return appBar;
  }

  Widget leadingItem() {
    return IconButton(
      icon: Icon(
        Icons.beach_access,
        color: leadingIconColor,
        size: 30,
      ),
      onPressed: () {},
    );
  }

  List<Widget> actionItems() {
    return <Widget>[
      if (selectedIndex == 1)
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
      if (selectedIndex == 2 && selectedIndex == 3)
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ))
    ];
  }

  void onBottomNavigationChanged(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        leadingIconColor = Colors.deepPurple[400];
        title = "board";
      } else if (selectedIndex == 1) {
        title = "Portfolio";
        leadingIconColor = Colors.yellow;
      } else if (selectedIndex == 2) {
        title = "Statistics";
        leadingIconColor = Colors.green;
      } else if (selectedIndex == 3) {
        title = "Blogs";
        leadingIconColor = Colors.amber;
      }
    });
  }

  void onExpandChanged(bool expand) {
    expand = expand;
  }
}
