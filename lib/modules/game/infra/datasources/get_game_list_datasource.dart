import 'package:bolsista_tabuleiro_project/modules/game/infra/models/game_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/server_exception.dart';

abstract class GameDataSource {
  Future<List<GameModel>> getGamesList(int page);
  Future<GameModel> getGameDetails(int id);
}

class GameDioDataSourceImp implements GameDataSource {
  final Dio dio;

  GameDioDataSourceImp(this.dio);
  @override
  Future<List<GameModel>> getGamesList(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response =
        await dio.get('http://206.189.206.44:8080/api/jogo?page=$page',
            options: Options(
              headers: {'Authorization': token},
              contentType: Headers.formUrlEncodedContentType,
            ));

    if (response.statusCode == 200) {
      final result = response.data['content'];

      return List<dynamic>.from(result)
          .map((e) => GameModel.fromMap(e))
          .toList();
    } else {
      throw const ServerException('Erro ao buscar lista de jogos');
    }
  }

  @override
  Future<GameModel> getGameDetails(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await dio.get('http://206.189.206.44:8080/api/jogo/$id',
        options: Options(headers: {'Authorization': token}));
    if (response.statusCode == 200) {
      final result = response.data['content'];
      return result.map((e) => GameModel.fromMap(e));
    } else {
      throw const ServerException('Erro ao buscar lista de jogos');
    }
  }
}
