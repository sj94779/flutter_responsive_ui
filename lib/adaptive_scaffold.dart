import 'package:flutter/material.dart';

const kTabletBreakpoint = 600.0;
const kDesktopBreakpoint = 1200.0;
const kSideMenuWidth = 250.0;

class AdaptiveScaffold extends StatelessWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final bool expanded;
  final ValueChanged<int> onSelectionChanged;
  final ValueChanged<bool> onExpandChanged;
  final Widget body;
  final AppBar? appBar;

  const AdaptiveScaffold(
      {Key? key,
      required this.tabs,
      required this.selectedIndex,
      required this.onSelectionChanged,
      required this.onExpandChanged,
      required this.expanded,
      required this.body,
      this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, dimens) {
      if (dimens.maxWidth >= kDesktopBreakpoint) {
        const normalColor = Colors.black;
        const selectedColor = Colors.grey;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Row(
            children: [
              SizedBox(
                width: 240,
                child: ListView(
                  children: [
                    for (var i = 0; i < tabs.length; i++)
                      ListTile(
                        selected: selectedIndex == i,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        title: Text(
                          tabs[i].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: (selectedIndex == i)
                                  ? selectedColor
                                  : normalColor),
                        ),
                        leading: Icon(
                            selectedIndex == i
                                ? tabs[i].activeIcon
                                : tabs[i].icon,
                            color: (selectedIndex == i)
                                ? selectedColor
                                : normalColor),
                        onTap: () => onSelectionChanged(i),
                      ),
                  ],
                ),
              ),
              const VerticalDivider(width: 2),
              Expanded(
                child: body, // buildBody(selectedIndex, tabs),
              ),
            ],
          ),
        );
      }
      if (dimens.maxWidth >= kTabletBreakpoint) {
        const normalColor = Colors.black;
        const selectedColor = Colors.grey;
        return Scaffold(
          appBar: appBar,
          body: Row(
            children: [
              SizedBox(
                width: 100,
                child: ListView(
                  children: [
                    for (var i = 0; i < tabs.length; i++)
                      InkWell(
                        onTap: () => onSelectionChanged(i),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Icon(
                                selectedIndex == i
                                    ? tabs[i].activeIcon
                                    : tabs[i].icon,
                                color: selectedIndex == i
                                    ? selectedColor
                                    : normalColor),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              selectedIndex == i ? tabs[i].title : "",
                              style: TextStyle(
                                  color: selectedIndex == i
                                      ? selectedColor
                                      : normalColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const VerticalDivider(width: 2),
              Expanded(
                child: body, // buildBody(selectedIndex, tabs),
              ),
            ],
          ),
        );
      }

      final items = tabs
          .where((element) => element.phoneOnly)
          .map((item) => BottomNavigationBarItem(
                label: item.title,
                icon: Icon(item.icon),
                activeIcon: Icon(item.activeIcon),
              ));
      return Scaffold(
        appBar: appBar,
        body: body, // buildBody(selectedIndex, tabs),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showUnselectedLabels: false,
          onTap: (val) => onSelectionChanged(val),
          items: items.toList(growable: false),
        ),
      );
    });
  }
}

class TabItem {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final bool phoneOnly;

  TabItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
    this.phoneOnly = true,
  });
}
