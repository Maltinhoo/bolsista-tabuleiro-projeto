import 'package:bolsista_tabuleiro_project/modules/login/domain/entities/user_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/login/infra/datasources/login_datasource.dart';
import 'package:bolsista_tabuleiro_project/modules/preferences/preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDioDataSourceImp implements LoginDataSource {
  final Dio dio;
  final IPreferencesHelper preferencesHelper;

  LoginDioDataSourceImp(
    this.dio,
    this.preferencesHelper,
  );
  @override
  Future<String> login(UserEntity user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await dio.post(
        'http://206.189.206.44:8080/login',
        data: {
          'email': user.email,
          'senha': user.password,
        },
      );
      prefs.setString('token', response.data);
      prefs.setBool('isLogged', true);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
