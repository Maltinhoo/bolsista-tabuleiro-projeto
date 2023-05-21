import 'package:bolsista_tabuleiro_project/modules/game/infra/models/game_model.dart';
import 'package:bolsista_tabuleiro_project/modules/game/presenter/widgets/game_is_expansion.dart';
import 'package:bolsista_tabuleiro_project/modules/game/presenter/widgets/info_game.dart';
import 'package:bolsista_tabuleiro_project/modules/game/presenter/widgets/minumum_age.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/common_app_bar.dart';
import '../../login/presenter/login_page.dart';

class GamePage extends StatelessWidget {
  final GameModel game;
  final VoidCallback onLogout;
  const GamePage({super.key, required this.game, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CommonAppBar(
            title: game.name,
            onLogout: () {
              onLogout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            },
          )),
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              width: kIsWeb ? MediaQuery.of(context).size.width * 0.5 : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoGame(game: game),
                    const SizedBox(height: 15),
                    MinimumAge(minAge: game.minAge),
                    const SizedBox(height: 15),
                    const Text(
                      'Descrição do jogo',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      game.description,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Mecanicas',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      game.characteristics
                          .where(
                              (element) => element.type != 'DEPENDENCIA_IDIOMA')
                          .map((e) => e.description)
                          .join(', '),
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Artistas',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      game.artists.map((e) => e.name).join(', '),
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Editoras',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      game.designers.map((e) => e.name).join(', '),
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (game.isExpansion) const GameIsExpansion()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
