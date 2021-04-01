import 'package:adoption_app/core/core.dart';
import 'package:adoption_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'tab_item.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  TabItem _currentTab = TabItem.discover;
  final _navigatorKeys = {
    TabItem.discover: GlobalKey<NavigatorState>(),
    TabItem.message: GlobalKey<NavigatorState>(),
    TabItem.notification: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: ColorPalette.instance.electricViolet,
          inactiveColor: ColorPalette.instance.snuff,
          items: _buildItemList,
          onTap: _onTap,
        ),
        tabBuilder: (context, index) {
          final showItem = TabItem.values[index];
          return CupertinoTabView(
            onGenerateRoute: (routeSettings) {},
            routes: _routeBuilders(context),
            navigatorKey: _navigatorKeys[showItem],
            builder: (context) => _pageBuilder[showItem]!,
          );
        });
  }

  void _onTap(index) {
    setState(() {
      var _selectedTab = TabItem.values[index];
      _selectedTab == _currentTab
          ? _navigatorKeys[_selectedTab]!
              .currentState!
              .popUntil((route) => route.isFirst)
          : _currentTab = _selectedTab;
    });
  }

  List<BottomNavigationBarItem> get _buildItemList {
    return [
      _buildItem(TabItem.discover),
      _buildItem(TabItem.message),
      _buildItem(TabItem.notification),
      _buildItem(TabItem.profile),
    ];
  }

  Map<TabItem, Widget> get _pageBuilder => <TabItem, StatelessWidget>{
        TabItem.discover: Home(),
        TabItem.message: MessageView(),
        TabItem.notification: NotificationView(),
        TabItem.profile: ProfileView(),
      };

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      Home.routeName: (context) => Home(),
      DetailView.routeName: (context) => DetailView(),
      MessageView.routeName: (context) => MessageView(),
      NotificationView.routeName: (context) => NotificationView(),
      ProfileView.routeName: (context) => ProfileView()
    };
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(icon: _iconTabMatching(tabItem));
  }

  SvgPicture _iconTabMatching(TabItem item) {
    return SvgPicture.asset(
      _currentTab == item ? item.activeSvg : item.passiveSvg,
      color: _colorTabMatching(item),
    );
  }

  Color _colorTabMatching(TabItem item) {
    return _currentTab == item
        ? ColorPalette.instance.electricViolet
        : ColorPalette.instance.snuff;
  }
}
