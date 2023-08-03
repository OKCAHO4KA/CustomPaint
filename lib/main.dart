import 'package:custom_painters/src/retos/cuadrado_animado.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: CuadradoAnimadoPage());
  }
}
