import '../../dominio/repositories/ilocal_repository.dart';
import '../datasources/local/flutter_storage_local.dart';

class FlutterStorageRepository implements ILocalRepository {
  final FlutterStorageLocal _local;
  FlutterStorageRepository(this._local);

  @override
  Future<String?> getToken() {
    return _local.getToken();
  }

  @override
  Future<void> saveToken(String token) {
    return _local.saveToken(token);
  }
}
