import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/game_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/game/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/get_game_list_datasource.dart';

class GameRepositoryImp extends GameRepository {
  final GameDataSource dataSource;

  GameRepositoryImp(this.dataSource);
  @override
  Future<Either<Exception, List<GameEntity>>> getGamesList(int page) async {
    try {
      final result = await dataSource.getGamesList(page);
      return Right(result);
    } catch (e) {
      return Left(Exception('Erro ao buscar lista de jogos'));
    }
  }

  @override
  Future<Either<Exception, GameEntity>> getGameDetails(int id) async {
    try {
      final result = await dataSource.getGameDetails(id);
      return Right(result);
    } catch (e) {
      return Left(Exception('Erro ao buscar detalhes do jogo'));
    }
  }
}
