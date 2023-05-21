import 'package:bloc/bloc.dart';
import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/game/domain/usecases/get_games_list_usecase.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../game/domain/entities/game_entity.dart';
import '../../../preferences/preferences_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetGamesListUseCase getGamesListUseCase;
  final LoginUseCase loginUseCase;
  HomeCubit(this.getGamesListUseCase, this.loginUseCase) : super(HomeInitial());

  List<GameEntity> gamesList = [];
  bool isLastPage = false;

  int currentPage = 1;

  Future<void> getGamesList() async {
    emit(HomeLoading());
    // await login();
    final result = await getGamesListUseCase(currentPage);
    result.fold((l) => emit(HomeError(l.toString())), (r) {
      gamesList = r;
      emit(HomeSuccess(gamesList));
    });
  }

  Future<void> loadMoreGames() async {
    if (isLastPage) return;
    emit(HomeLoadingMore(gamesList));
    final result = await getGamesListUseCase(++currentPage);
    print(currentPage);
    result.fold((l) {
      currentPage--;
      emit(HomeError(l.toString()));
    }, (r) {
      if (r.isEmpty || r.length < 10) {
        isLastPage = true;
      } else {
        gamesList.addAll(r);
      }
      emit(HomeSuccess(gamesList));
    });
  }

  Future<void> tryAgain() async {
    emit(HomeLoading());
    emit(HomeSuccess(gamesList));
  }

  Future<void> logout() async {
    emit(HomeLoading());
    inject<IPreferencesHelper>().clear();
    emit(HomeLogout());
  }
}
