import 'dart:ui';
import 'dart:io';

class Layout {

  static double dpr;
  static double kWindowWidth;
  static double kWindowHeight;
  static double kScreenWidth;
  static double kScreenHeight;
  static double kStatusBarHeight;
  static double kNavigationBarHeight;
  static double kBottomAreaHeight;
  static double kTabBarHeight;

  static init() {

    dpr = window.devicePixelRatio;

    kWindowWidth = window.physicalSize.width;
    kWindowHeight = window.physicalSize.height;

    kScreenWidth = kWindowWidth / dpr;
    kScreenHeight = kWindowHeight / dpr;

    kStatusBarHeight = window.padding.top / dpr;
    kBottomAreaHeight = window.padding.bottom / dpr;

    if (Platform.isIOS) {
      kNavigationBarHeight = kStatusBarHeight + 44;
      kTabBarHeight = kBottomAreaHeight + 49;
    } else if (Platform.isAndroid) {
      kNavigationBarHeight = kStatusBarHeight + 48;
      kTabBarHeight = kBottomAreaHeight + 49;
    }

  }

}

extension doubleExtension on double {

  double get pt {
    return this *  Layout.kScreenWidth / 375.0;
  }

  double get px {
    return this *  Layout.kScreenWidth / 750.0;
  }

}

extension intExtension on int {

  double get pt {
    return this *  Layout.kScreenWidth / 375.0;
  }

  double get px {
    return this *  Layout.kScreenWidth / 750.0;
  }
}
