import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/home/presenter/widgets/game_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/common_app_bar.dart';
import '../../game/infra/models/game_model.dart';
import '../../game/presenter/game_page.dart';
import '../../login/presenter/login_page.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CommonAppBar(
              onLogout: () {
                inject<HomeCubit>().logout();
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              },
            )),
        body: BlocProvider(
          create: (context) => inject<HomeCubit>()..getGamesList(),
          child: BlocListener<HomeCubit, HomeState>(
            bloc: inject<HomeCubit>(),
            listener: (context, state) {
              if (state is HomeLogout) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              }
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            if (kIsWeb)
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: [
                                  ...state.games.map((e) => GameCard(
                                        gameModel: e as GameModel,
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => GamePage(
                                                      game: e,
                                                      onLogout: () {
                                                        inject<HomeCubit>()
                                                            .logout();
                                                        Navigator.pop(context);
                                                      },
                                                    ))),
                                      )),
                                ],
                              ),
                            if (!kIsWeb)
                              ...state.games.map((e) => GameCard(
                                    gameModel: e as GameModel,
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GamePage(
                                                  game: e,
                                                  onLogout: () {
                                                    inject<HomeCubit>()
                                                        .logout();
                                                    Navigator.pop(context);
                                                  },
                                                ))),
                                  )),
                            const SizedBox(height: 10),
                            if (state is! HomeLoadingMore &&
                                !context.read<HomeCubit>().isLastPage)
                              ElevatedButton(
                                onPressed: () {
                                  context.read<HomeCubit>().loadMoreGames();
                                },
                                child: const Text('Carregar mais'),
                              ),
                            if (state is HomeLoadingMore)
                              const Center(
                                child: CircularProgressIndicator(),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
