import 'package:bloc/bloc.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      await loginUseCase(UserEntity(email: email, password: password));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> initialize() async {
    emit(LoginLoading());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getBool('isLogged') ?? false) {
      emit(LoginSuccess());
    } else {
      emit(LoginInitial());
    }
  }
}
