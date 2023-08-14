import 'package:custom_painters/src/pages/launcher_page.dart';
import 'package:custom_painters/src/pages/launcher_tablet_page%20.dart';
import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => ThemeChanger(2), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: themeChanger.currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }

          // print('Orientation $orientation');
          //
        }));
  }
}
