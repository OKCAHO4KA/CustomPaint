import 'package:custom_painters/src/widgets/slideshow.dart';
import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeChanger>(context).currentTheme.hoverColor,
      body: const Center(
        child: Column(children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ]),
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themePro = Provider.of<ThemeChanger>(context);
    return Slideshow(
      bulletActivo: 20, bulletDesactivo: 10,
      colorActivo: themePro.darkTheme
          ? themePro.currentTheme.indicatorColor
          : const Color(0xff3F3D56),

      colorDesactivo: Colors.white,
      // pointesUp: true,
      slides: [
        SvgPicture.asset('assets/love.svg'),
        SvgPicture.asset(
          'assets/unlock.svg',
        ),
        SvgPicture.asset(
          'assets/family.svg',
        ),
        SvgPicture.asset(
          'assets/snow.svg',
        ),
        SvgPicture.asset(
          'assets/testing.svg',
        ),
      ],
    );
  }
}
