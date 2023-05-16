import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/game_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/game_repository.dart';

abstract class GetGameDetailsUseCase {
  Future<Either<Exception, GameEntity>> call(int id);
}

class GetGameDetailsUseCaseImp implements GetGameDetailsUseCase {
  final GameRepository repository;

  GetGameDetailsUseCaseImp(this.repository);

  @override
  Future<Either<Exception, GameEntity>> call(int id) async {
    return await repository.getGameDetails(id);
  }
}
