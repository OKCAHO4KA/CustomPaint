import 'dart:math';

import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CuadradoAnimado()),
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

  Animation<double>? moverDerecha;
  Animation<double>? moverArriba;
  Animation<double>? moverIzquierda;
  Animation<double>? moverAbajo;
  Animation<double>? rotation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));

    moverDerecha = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticInOut)));

    moverArriba = Tween(begin: 0.0, end: -150.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.25, 0.5, curve: Curves.elasticInOut)));

    moverIzquierda = Tween(begin: 0.0, end: -150.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.5, 0.75, curve: Curves.elasticInOut)));
    moverAbajo = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1, curve: Curves.elasticInOut)));

    rotation = Tween(begin: 0.0, end: 2 * pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reverse();
      }
    });
    controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller!,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(moverDerecha!.value + moverIzquierda!.value,
                  moverArriba!.value + moverAbajo!.value),
              child: Transform.rotate(angle: rotation!.value, child: child));
        },
        child: _Rectangulo());
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.teal),
    );
  }
}
