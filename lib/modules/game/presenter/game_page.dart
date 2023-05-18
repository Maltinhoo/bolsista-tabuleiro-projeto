import 'package:bolsista_tabuleiro_project/modules/game/infra/models/game_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/common_app_bar.dart';

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
            onLogout: onLogout,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: game.image,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(game.name),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
