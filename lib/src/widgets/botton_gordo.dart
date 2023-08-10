import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPressed;

  const BottonGordo(
      {super.key,
      required this.icon,
      required this.texto,
      this.color1 = const Color(0xff6989f5),
      this.color2 = const Color(0xff906ef5),
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Stack(children: [
        _BottonGordoBackground(
          icon: icon,
          color1: color1,
          color2: color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 140,
              width: 40,
            ),
            FaIcon(
              icon,
              // FontAwesomeIcons.carBurst,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(texto,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            const SizedBox(
              width: 40,
            )
          ],
        )
      ]),
    );
  }
}

class _BottonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  const _BottonGordoBackground(
      {required this.color1, required this.color2, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                top: -20,
                right: -20,
                child: FaIcon(
                  icon,
                  color: Colors.white.withOpacity(0.2),
                  size: 150,
                ))
          ],
        ),
      ),
    );
  }
}
