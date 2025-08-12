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
        return 'http://192.168.0.8:8000/';
      case Flavor.STG:
        return 'http://147.182.205.111:4500/';
      case Flavor.PROD:
        return 'http://147.182.205.111:4500/';
    }
  }
}
