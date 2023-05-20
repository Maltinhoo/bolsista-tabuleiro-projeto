import 'package:flutter/material.dart';

class MinimumAge extends StatefulWidget {
  final int minAge;
  const MinimumAge({
    super.key,
    required this.minAge,
  });

  @override
  State<MinimumAge> createState() => _MinimumAgeState();
}

class _MinimumAgeState extends State<MinimumAge> {
  String restriction = 'L';
  Color color = const Color(0xff079237);

  @override
  void initState() {
    _minAge();
    super.initState();
  }

  void _minAge() {
    if (widget.minAge < 9) {
      setState(() {
        restriction = 'L';
        color = const Color(0xff079237);
      });
    } else if (widget.minAge < 12) {
      setState(() {
        restriction = '10';
        color = const Color(0xff0086D8);
      });
    } else if (widget.minAge < 14) {
      setState(() {
        restriction = '12';
        color = const Color(0xffFCCF02);
      });
    } else if (widget.minAge < 16) {
      setState(() {
        restriction = '14';
        color = const Color(0xffFF6A00);
      });
    } else if (widget.minAge < 18) {
      setState(() {
        restriction = '16';
        color = const Color(0xffFF030E);
      });
    } else {
      setState(() {
        restriction = '18';
        color = const Color(0xff030000);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          child: Text(
            restriction,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            restriction == 'L'
                ? 'Livre'.toUpperCase()
                : 'Não recomendado para menores de $restriction anos'
                    .toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
