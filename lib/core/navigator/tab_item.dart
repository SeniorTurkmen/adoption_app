import '../core.dart';

enum TabItem { discover, message, notification, profile }

const Map<TabItem, String> tabName = {
  TabItem.discover: 'Discover',
  TabItem.message: 'Message',
  TabItem.notification: 'Notification',
  TabItem.profile: 'Profile'
};

extension TabItemMap on TabItem {
  String get passiveSvg {
    switch (this) {
      case TabItem.discover:
        return SvgConstant.instance.passiveExplore;
      case TabItem.message:
        return SvgConstant.instance.passiveMessage;
      case TabItem.notification:
        return SvgConstant.instance.passiveNotification;
      case TabItem.profile:
        return SvgConstant.instance.passiveProfile;
    }
  }

  String get activeSvg {
    switch (this) {
      case TabItem.discover:
        return SvgConstant.instance.activeExplore;
      case TabItem.message:
        return SvgConstant.instance.activeMessage;
      case TabItem.notification:
        return SvgConstant.instance.activeNotification;
      case TabItem.profile:
        return SvgConstant.instance.activeProfile;
    }
  }
}
