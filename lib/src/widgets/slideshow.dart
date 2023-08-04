import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool? pointesUp;
  final Color? colorActivo;
  final Color? colorDesactivo;
  final double? bulletActivo;
  final double? bulletDesactivo;

  const Slideshow(
      {super.key,
      required this.slides,
      this.pointesUp = false,
      this.colorActivo = Colors.blue,
      this.colorDesactivo = Colors.grey,
      this.bulletActivo = 12,
      this.bulletDesactivo = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SliderModel(),
      child: SafeArea(child: Center(child: Builder(builder: (context) {
        Provider.of<_SliderModel>(context).colorActivo = colorActivo!;

        Provider.of<_SliderModel>(context).colorDesactivo = colorDesactivo!;
        Provider.of<_SliderModel>(context).bulletActivo = bulletActivo!;
        Provider.of<_SliderModel>(context).bulletDesactivo = bulletDesactivo!;

        return _CrearEscructuraSlideshow(pointesUp: pointesUp, slides: slides);
      }))),
    );
  }
}

class _CrearEscructuraSlideshow extends StatelessWidget {
  const _CrearEscructuraSlideshow({
    required this.pointesUp,
    required this.slides,
  });

  final bool? pointesUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (pointesUp!)
          _Dots(
            length: slides.length,
          ),
        Expanded(child: _Slides(slides)),
        if (!pointesUp!)
          _Dots(
            length: slides.length,
          ),
      ],
    );
  }
}

// class _Dots extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: double.infinity,
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [_Dot(0), _Dot(1), _Dot(2)],
//       ),
//     );
//   }
// }

class _Dots extends StatelessWidget {
  final int length;
  // final Color? colorActivo;
  // final Color? colorDesactivo;
  const _Dots({required this.length});
  //  this.colorActivo, this.colorDesactivo});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index)),
      ),
      // child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: length,
      //     itemBuilder: (context, index) {
      //       return _Dot(index);
      //     }),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  // final Color? colorActivo;
  // final Color? colorDesactivo;

  const _Dot(
    this.index,
  );
  //this.colorActivo, this.colorDesactivo

  @override
  Widget build(BuildContext context) {
    final provideSliderModel = Provider.of<_SliderModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: (provideSliderModel.currentPage.round() == index)
          ? Provider.of<_SliderModel>(context).bulletActivo
          : Provider.of<_SliderModel>(context).bulletDesactivo,
      height: (provideSliderModel.currentPage.round() == index)
          ? Provider.of<_SliderModel>(context).bulletActivo
          : Provider.of<_SliderModel>(context).bulletDesactivo,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (provideSliderModel.currentPage.round() == index)
              ? provideSliderModel.colorActivo
              : provideSliderModel.colorDesactivo),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          children: widget.slides.map((widgetSvg) => _Slide(widgetSvg)).toList()
          // _Slide('assets/love.svg'),
          // _Slide(
          //   'assets/unlock.svg',
          // ),
          // _Slide(
          //   'assets/family.svg',
          // ),

          ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.widgetSvg);
  final Widget widgetSvg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: widgetSvg,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorActivo = Colors.blue;
  Color _colorDesactivo = Colors.grey;
  double _bulletActivo = 12;
  double _bulletDesactivo = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }

  Color get colorActivo => _colorActivo;

  set colorActivo(Color colorNuevo) {
    _colorActivo = colorNuevo;
  }

  Color get colorDesactivo => _colorDesactivo;
  set colorDesactivo(Color colorNuevo) {
    _colorDesactivo = colorNuevo;
  }

  double get bulletActivo => _bulletActivo;

  set bulletActivo(double pixels) {
    _bulletActivo = pixels;
  }

  double get bulletDesactivo => _bulletDesactivo;

  set bulletDesactivo(double pixels) {
    _bulletDesactivo = pixels;
  }
}
