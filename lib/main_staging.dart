import 'package:admin_clinica_front/config/app_flavor_config.dart';
import 'package:admin_clinica_front/observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/main.dart';

void main() async {
  await dotenv.load(fileName: "assets/env/staging.env");
  AppFlavorConfig.appFlavor = Flavor.STG;

  bootstrap(() => const Main());
}
