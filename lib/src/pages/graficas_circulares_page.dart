import 'package:custom_painters/src/widgets/radial_progress.dart';
import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({super.key});

  @override
  State<GraficasCircularesScreen> createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        child: const Icon(
          Icons.pending_rounded,
        ),
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomRadialProgress(
            largo: 60,
            porcentaje: porcentaje,
            colorArco: Colors.amber,
          ),
          CustomRadialProgress(
            largo: 25,
            porcentaje: porcentaje,
            colorArco: Colors.indigo,
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomRadialProgress(
            largo: 229,
            porcentaje: porcentaje,
            colorArco: Colors.pink,
          ),
          CustomRadialProgress(
            largo: 40,
            porcentaje: porcentaje,
            colorArco: Colors.cyan,
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomRadialProgress(
            largo: 100,
            porcentaje: porcentaje * 1.2,
            colorArco: Colors.teal,
          ),
          CustomRadialProgress(
            largo: 120,
            porcentaje: porcentaje * 1.6,
            colorArco: Colors.purple,
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomRadialProgress(
            largo: 140,
            porcentaje: porcentaje * 1.9,
            colorArco: Colors.orangeAccent,
          ),
          CustomRadialProgress(
            largo: 76,
            porcentaje: porcentaje,
            colorArco: Colors.redAccent,
          )
        ]),
      ]),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorArco,
    required this.largo,
  });

  final double porcentaje;
  final double largo;

  final Color colorArco;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return SizedBox(
      width: largo,
      height: largo,
      child: RadialProgress(
        grosorCirculo: 7,
        grosorArco: 10,
        porcentaje: porcentaje,
        colorArco: colorArco,
        colorCirculo: themeChanger.currentTheme.textTheme.bodyMedium!.color,
      ),
    );
  }
}
