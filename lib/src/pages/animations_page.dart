import 'dart:math';

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotation;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;

  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2 * pi).animate(
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.25, 0.75, curve: Curves.easeInOut)));

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller!);

    agrandar = Tween(begin: 0.0, end: 5.0).animate(controller!);
    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return AnimatedBuilder(
        animation: controller!,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(moverDerecha!.value, moverDerecha!.value),
            child: Transform.rotate(
                angle: rotation!.value,
                child: Opacity(
                    opacity: opacidadOut!.value,
                    child:
                        Transform.scale(scale: agrandar!.value, child: child))),
          );
        },
        child: _Rectangulo());
  }
}

/////////////////////////////////////////////////
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.deepOrange),
    );
  }
}
