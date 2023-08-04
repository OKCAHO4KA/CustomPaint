import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color? colorArco;
  final Color? colorCirculo;
  final double grosorCirculo;
  final double grosorArco;

  const RadialProgress(
      {super.key,
      required this.porcentaje,
      this.colorArco = Colors.blue,
      this.colorCirculo = Colors.grey,
      this.grosorCirculo = 4.0,
      this.grosorArco = 10.0});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double? porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior!;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
        animation: controller!,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  porcentaje: (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller!.value),
                  colorArco: widget.colorArco!,
                  colorCirculo: widget.colorCirculo!,
                  grosorArco: widget.grosorArco,
                  grosorCirculo: widget.grosorCirculo),
            ),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final double? porcentaje;
  final Color? colorArco;
  final Color? colorCirculo;
  final double? grosorCirculo;
  final double? grosorArco;

  _MiRadialProgress(
      {this.porcentaje,
      this.colorArco,
      this.colorCirculo,
      this.grosorCirculo,
      this.grosorArco});

  @override
  void paint(Canvas canvas, Size size) {
//Gradient
    final Rect rect =
        Rect.fromCircle(center: const Offset(100, 0), radius: 100);

    final Gradient gradiente = LinearGradient(colors: [
      colorArco!,
      const Color.fromARGB(255, 17, 70, 64),
      const Color.fromARGB(255, 19, 202, 6)
    ]); //Circulo
    final paint = Paint()
      ..strokeWidth = grosorCirculo!
      ..color = colorCirculo!
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width * 0.5, size.height * 0.5);

    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosorArco!
      // ..color = colorArco!
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
// 2pi - es todo el circulo
    double arcAngle = 2 * pi * (porcentaje! / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
