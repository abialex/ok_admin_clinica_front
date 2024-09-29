import 'package:admin_clinica_front/app/config/app_flavor_config.dart';
import 'package:admin_clinica_front/observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:upgrader/upgrader.dart';
import 'app/main.dart';

void main() async {
  await dotenv.load(fileName: "assets/env/production.env");
  AppFlavorConfig.appFlavor = Flavor.PROD;
  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  bootstrap(() => const Main());
}
