import 'package:admin_clinica_front/config/app_flavor_config.dart';
import 'package:admin_clinica_front/observer.dart';
import 'ui/main.dart';

void main() {
  AppFlavorConfig.appFlavor = Flavor.DEV;

  bootstrap(() => const Main());
}
