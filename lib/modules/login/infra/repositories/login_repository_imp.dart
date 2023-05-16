import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_exception.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource datasource;

  LoginRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, String>> login(UserEntity user) async {
    try {
      final token = await datasource.login(user);
      return Right(token);
    } on ServerException {
      return const Left(ServerException(''));
    }
  }
}
