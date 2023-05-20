import 'dart:io';

import 'package:bolsista_tabuleiro_project/modules/login/domain/entities/user_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/login/infra/datasources/login_datasource.dart';
import 'package:bolsista_tabuleiro_project/modules/preferences/preferences_helper.dart';
import 'package:dio/dio.dart';

class LoginDioDataSourceImp implements LoginDataSource {
  final Dio dio;
  final IPreferencesHelper preferencesHelper;

  LoginDioDataSourceImp(
    this.dio,
    this.preferencesHelper,
  );
  @override
  Future<String> login(UserEntity user) async {
    try {
      final response = await dio.post(
        'http://206.189.206.44:8080/login',
        data: {
          'email': user.email,
          'senha': user.password,
        },
      );
      final token = response.data;
      await preferencesHelper.setToken(token);
      await preferencesHelper.setIsLogged();
      return token;
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        throw Exception('Usuário ou senha inválidos');
      } else {
        throw Exception('Erro ao realizar login');
      }
    }
  }
}
