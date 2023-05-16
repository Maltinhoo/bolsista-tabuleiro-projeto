import '../../domain/entities/user_entity.dart';

abstract class LoginDataSource {
  Future<String> login(UserEntity user);
}
