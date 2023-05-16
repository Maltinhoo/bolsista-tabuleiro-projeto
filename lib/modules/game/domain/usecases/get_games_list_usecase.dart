import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/game_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/game_repository.dart';

abstract class GetGamesListUseCase {
  Future<Either<Exception, List<GameEntity>>> call(int page);
}

class GetGamesListUseCaseImp implements GetGamesListUseCase {
  final GameRepository _gameRepository;

  GetGamesListUseCaseImp(this._gameRepository);

  @override
  Future<Either<Exception, List<GameEntity>>> call(int page) async {
    return await _gameRepository.getGamesList(page);
  }
}
