import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, String>> login(UserEntity user);
}
