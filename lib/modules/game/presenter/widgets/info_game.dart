import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../infra/models/game_model.dart';
import 'details_game.dart';

class InfoGame extends StatelessWidget {
  const InfoGame({
    super.key,
    required this.game,
  });

  final GameModel game;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: game.id,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              imageUrl: game.image,
              width: 130,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              DetailsGame(
                label: game.year.toString(),
                icon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 10),
              DetailsGame(
                label: game.maxPlayers.toString(),
                icon: Icons.people_alt_outlined,
              ),
              const SizedBox(height: 10),
              DetailsGame(
                label: game.duration.toString(),
                icon: Icons.timer_outlined,
              ),
            ],
          ),
        )
      ],
    );
  }
}
