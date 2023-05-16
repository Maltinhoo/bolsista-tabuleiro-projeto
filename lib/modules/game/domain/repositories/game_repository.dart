import 'package:dartz/dartz.dart';

import '../entities/game_entity.dart';

abstract class GameRepository {
  Future<Either<Exception, List<GameEntity>>> getGamesList(int page);
  Future<Either<Exception, GameEntity>> getGameDetails(int id);
}
