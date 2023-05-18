import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final Function() onLogout;
  final String? title;
  const CommonAppBar({
    super.key,
    required this.onLogout,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Jogos',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    title: const Text(
                      'Tem certeza que deseja sair?',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(onPressed: onLogout, child: const Text('Sim')),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Não')),
                    ],
                  )),
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
