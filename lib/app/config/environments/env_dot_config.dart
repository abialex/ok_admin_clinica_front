import 'package:admin_clinica_front/app/config/app_flavor_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvDotConfig {
  static Future<void> initialize() async {
    switch (AppFlavorConfig.appFlavor) {
      case Flavor.DEV:
        await dotenv.load(fileName: "assets/env/develop.env");

      case Flavor.STG:
        await dotenv.load(fileName: "assets/env/staging.env");

      case Flavor.PROD:
        await dotenv.load(fileName: "assets/env/production.env");

      default:
    }
  }
}
