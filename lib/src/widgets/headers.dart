import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color(0xff615AAB),
      ),
      height: 300,
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTriangular()),
    );
  }
}

class _HeaderTriangular extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // path.moveTo(0, size.height * 0.35);
    // path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);
    // path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPico()),
    );
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // path.moveTo(0, size.height * 0.35);

    path.lineTo(0, size.height * 0.22);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.22);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvo()),
    );
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // path.moveTo(0, size.height * 0.35);

    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  final Color color;
  const HeaderWaves({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWaves(color)),
    );
  }
}

class _HeaderWaves extends CustomPainter {
  final Color color;

  _HeaderWaves(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color; // const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.35);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.45,
        size.width * 0.5, size.height * 0.35);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.35);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWavesDownGradient extends StatelessWidget {
  const HeaderWavesDownGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: const Color(0xff615AAB),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavesDownGradient()),
    );
  }
}

class _HeaderWavesDownGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // paint.color = const Color(0xff615AAB);
    paint.color = const Color(0xff615AAB);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final Rect rect =
        Rect.fromCircle(center: const Offset(180, 55), radius: 150);

    const Gradient gradient = LinearGradient(
        colors: [Color(0xff6D05e8), Color(0xffc012ff), Color(0xff6d05fc)]);
    paint.shader = gradient.createShader(rect);

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65,
        size.width * 0.5, size.height * 0.75);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.70);

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color? color1;
  final Color? color2;

  const IconHeader(
      {super.key,
      required this.icon,
      required this.titulo,
      required this.subtitulo,
      this.color1 = const Color(0xff526bf6),
      this.color2 = const Color(0xff67acf2)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1!,
          color2: color2!,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(subtitulo,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.7))),
            const SizedBox(
              height: 20,
            ),
            Text(titulo,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.7))),
            const SizedBox(
              height: 20,
            ),
            FaIcon(icon, size: 80, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(100)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color1, color2])));
  }
}
