import 'package:bolsista_tabuleiro_project/modules/login/domain/entities/user_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCase {
  Future<Either<Exception, String>> call(UserEntity user);
}

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseImp(this._repository);
  @override
  Future<Either<Exception, String>> call(UserEntity user) async {
    return await _repository.login(user);
  }
}
