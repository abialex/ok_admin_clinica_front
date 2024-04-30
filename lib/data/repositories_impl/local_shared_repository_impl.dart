import '../../dominio/repositories/ilocal_repository.dart';
import '../datasources/local/shared_preferences_local.dart';

class SharedPreferencesRepository implements ILocalRepository {
  final SharedPreferencesLocal _local;
  SharedPreferencesRepository(this._local);
  @override
  Future<String?> getToken() {
    return _local.getToken();
  }

  @override
  Future<void> saveToken(String token) {
    return _local.saveToken(token);
  }
}
