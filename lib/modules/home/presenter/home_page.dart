import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/home/presenter/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../game/infra/models/game_model.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar()),
        body: BlocProvider(
          create: (context) => inject<HomeCubit>()..getGamesList(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeSuccess) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      ...state.games
                          .map((e) => GameCard(gameModel: e as GameModel)),
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
        ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Jogos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
