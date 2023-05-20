import 'package:flutter/material.dart';

class GameIsExpansion extends StatelessWidget {
  const GameIsExpansion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.info_outline, size: 25),
        Text(
          'Este é um jogo do tipo expansão',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
