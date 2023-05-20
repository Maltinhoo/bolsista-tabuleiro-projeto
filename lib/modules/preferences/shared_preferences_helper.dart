import 'package:bolsista_tabuleiro_project/modules/preferences/preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper implements IPreferencesHelper {
  final SharedPreferences sharedPreferences;
  SharedPreferencesHelper(this.sharedPreferences);
  @override
  Future<bool> getIsLogged() async {
    var isLogged = sharedPreferences.getBool('isLogged');
    return isLogged ?? false;
  }

  @override
  Future<String> getToken() async {
    var token = sharedPreferences.getString('token');
    return token ?? '';
  }

  @override
  Future<void> setIsLogged() async {
    await sharedPreferences.setBool('isLogged', true);
  }

  @override
  Future<void> setToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
