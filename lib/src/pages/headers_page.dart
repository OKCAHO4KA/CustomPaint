import 'package:custom_painters/src/widgets/headers.dart';
import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChander = Provider.of<ThemeChanger>(context);
    return Scaffold(
        body: HeaderWaves(
      color: themeChander.currentTheme.indicatorColor,
    ));
  }
}
