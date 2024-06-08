// ignore_for_file: constant_identifier_names

enum Flavor {
  DEV,
  STG,
  PROD,
}

class AppFlavorConfig {
  static Flavor? appFlavor;

  static String get building {
    return appFlavor.toString();
  }

  static String get urlApp {
    switch (appFlavor!) {
      case Flavor.DEV:
        return 'http://192.168.100.192:8000/';
      case Flavor.STG:
        return 'http://alex-ya.me:4500/';
      case Flavor.PROD:
        return 'http://alex-ya.me:4500/';
    }
  }
}
