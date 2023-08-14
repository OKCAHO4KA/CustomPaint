import 'package:custom_painters/src/pages/animations_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_painters/src/pages/emergency_layout.dart';
import 'package:custom_painters/src/pages/graficas_circulares_page.dart';
import 'package:custom_painters/src/pages/headers_page.dart';
import 'package:custom_painters/src/pages/pinterest_page.dart';
import 'package:custom_painters/src/pages/slideshow_page.dart';
import 'package:custom_painters/src/pages/sliver_list_page.dart';

final pageRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', const HeadersPage()),
  _Route(
      FontAwesomeIcons.peopleCarryBox, 'CuardoAnimado', const AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Graficas Circulares',
      const GraficasCircularesScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
