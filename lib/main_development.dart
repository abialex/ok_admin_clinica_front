import 'package:admin_clinica_front/app/config/app_flavor_config.dart';
import 'package:admin_clinica_front/observer.dart';
import 'app/main.dart';

void main() async {
  AppFlavorConfig.appFlavor = Flavor.DEV;

  await bootstrap(() => const Main());
}
