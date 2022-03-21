import 'dart:io';

class AdHelper {


  static String appAdId = Platform.isAndroid
      ? 'ca-app-pub-8843235181779491~8302306591'
      : 'ca-app-pub-8843235181779491~3716943682' ;

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8843235181779491/1042763672';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8843235181779491/9240733100';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  // static String get nativeAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-8843235181779491/1998270273';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/3986624511';
  //   }
  //   throw new UnsupportedError("Unsupported platform");
  // }

  // static String get interstitialAdUnitIdSplash {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-8843235181779491/7612178787';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-8843235181779491/9736567255';
  //   }
  //   throw new UnsupportedError("Unsupported platform");
  // }

  static String get interstitialAdUnitIdPageDetails {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8843235181779491/3739570002';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8843235181779491/2567513541';
    }
    throw new UnsupportedError("Unsupported platform");
  }
}

