abstract class ILocalRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}
