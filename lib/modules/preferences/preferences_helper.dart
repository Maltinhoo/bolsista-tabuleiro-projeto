abstract class IPreferencesHelper {
  Future<void> setIsLogged();
  Future<bool> getIsLogged();
  Future<void> setToken(String token);
  Future<String> getToken();
}
