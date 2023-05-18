part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<GameEntity> games;

  const HomeSuccess(this.games);
}

class HomeLoadingMore extends HomeSuccess {
  const HomeLoadingMore(super.games);
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}

class HomeLogout extends HomeState {}
