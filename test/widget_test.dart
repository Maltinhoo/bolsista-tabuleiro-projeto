import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/entities/user_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  LoginUseCase useCase = inject();

  test('Faça Login', () async {
    final user =
        UserEntity(email: 'candidato@tabulero.com.br', password: '123456');
    final result = await useCase(user);

    result.fold((l) => print(l), (r) => print(r));

    expect(result.isRight(), true);
  });
}
