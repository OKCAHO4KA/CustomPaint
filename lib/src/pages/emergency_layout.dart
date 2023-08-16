import 'package:animate_do/animate_do.dart';
import 'package:custom_painters/src/widgets/botton_gordo.dart';
import 'package:custom_painters/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

    // List<Widget> itemMap = [
    //   BottonGordo(
    //     icon: items[0].icon,
    //     texto: items[0].texto,
    //     onPressed: () {
    //       print('items[0]');
    //     },
    //     color1: items[0].color1,
    //     color2: items[0].color2,
    //   ),
    //   BottonGordo(
    //     icon: items[1].icon,
    //     texto: items[1].texto,
    //     onPressed: () {
    //       print('items[1]');
    //     },
    //     color1: items[1].color1,
    //     color2: items[1].color2,
    //   ),
    //   BottonGordo(
    //     icon: items[2].icon,
    //     texto: items[2].texto,
    //     onPressed: () {
    //       print('items[2]');
    //     },
    //     color1: items[2].color1,
    //     color2: items[2].color2,
    //   )
    // ];

    List<Widget> itemMap = items
        .map((item) => FadeInRight(
              child: BottonGordo(
                icon: item.icon,
                texto: item.texto,
                onPressed: () {},
                color1: item.color1,
                color2: item.color2,
              ),
            ))
        .toList();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
          child: SafeArea(
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              if (isLarge) const SizedBox(height: 80),
              ...itemMap
            ]),
          ),
        ),
        if (isLarge) const _Encabezado()
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'has solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
            right: 0,
            top: 50,
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

// class BotomGordoTemp extends StatelessWidget {
//   const BotomGordoTemp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottonGordo(
//       icon: FontAwesomeIcons.carBurst,
//       texto: 'Motor Accident',
//       onPressed: () {
//         print('motor accident');
//       },
//     );
//   }
// }

// class PageHeader extends StatelessWidget {
//   const PageHeader({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const IconHeader(
//         // color1: Colors.deepOrange,
//         // color2: Colors.yellowAccent
//         icon: FontAwesomeIcons.plus,
//         subtitulo: 'Has solicitado',
//         titulo: 'Asistencia médica');
//   }
// }
