import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient {
  Future<SharedPreferences> createShredPreferences() async {
    final result = await SharedPreferences.getInstance();
    return result;
  }
}
