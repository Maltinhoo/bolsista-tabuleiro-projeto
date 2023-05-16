import 'package:bolsista_tabuleiro_project/modules/game/domain/usecases/get_game_details_usecase.dart';
import 'package:bolsista_tabuleiro_project/modules/home/presenter/cubit/home_cubit.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/repositories/login_repository.dart';
import 'package:bolsista_tabuleiro_project/modules/login/domain/usecases/login_usecase.dart';
import 'package:bolsista_tabuleiro_project/modules/login/external/dio/login_dio_datasource_imp.dart';
import 'package:bolsista_tabuleiro_project/modules/login/infra/datasources/login_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../modules/game/domain/repositories/game_repository.dart';
import '../../modules/game/domain/usecases/get_games_list_usecase.dart';
import '../../modules/game/infra/datasources/get_game_list_datasource.dart';
import '../../modules/game/infra/repositories/game_repository_imp.dart';
import '../../modules/login/infra/repositories/login_repository_imp.dart';

GetIt inject = GetIt.I;

class Inject {
  static void init() {
    // GetIt.I.registerSingletonAsync<SharedPreferences>(
    //     () => SharedPreferences.getInstance());
    GetIt.I.registerFactory<Dio>(() => Dio());

    GetIt.I.registerLazySingleton<LoginDataSource>(
        () => LoginDioDataSourceImp(inject()));
    GetIt.I.registerLazySingleton<GameDataSource>(
        () => GameDioDataSourceImp(inject()));

    GetIt.I.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImp(inject()));
    GetIt.I.registerLazySingleton<GameRepository>(
        () => GameRepositoryImp(inject()));

    GetIt.I
        .registerLazySingleton<LoginUseCase>(() => LoginUseCaseImp(inject()));
    GetIt.I.registerLazySingleton<GetGamesListUseCase>(
        () => GetGamesListUseCaseImp(inject()));
    GetIt.I.registerFactory<GetGameDetailsUseCase>(
        () => GetGameDetailsUseCaseImp(inject()));

    GetIt.I
        .registerLazySingleton<HomeCubit>(() => HomeCubit(inject(), inject()));
  }
}