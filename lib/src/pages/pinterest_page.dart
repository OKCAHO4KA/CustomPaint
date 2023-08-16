import 'package:custom_painters/src/widgets/pinterest_menu.dart';
import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: const Scaffold(
          // floatingActionButton: PinterestMenu(),
          // body: PrinterestGrid(items: items),

          body: Stack(
        children: [
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],
      )),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation();

  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.sizeOf(context).width;

    final themeChanger = Provider.of<ThemeChanger>(context);

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
        bottom: 30,
        child: SizedBox(
            width: widthPantalla,
            child:
                //aqui ***
                Align(
                    child: PinterestMenu(
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
              background: themeChanger.currentTheme.scaffoldBackgroundColor,
              activeColor: themeChanger.currentTheme.indicatorColor,
              inactiveColor: Colors.white,
              mostrar: Provider.of<_MenuModel>(context).mostrar,
            ))));
  }
}

/*  
*** Row(children: [Spacer(),
PinterestMenu(
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, onPressed: () {}),
                    ],
                    Spacer(),
])
*/

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({
    super.key,
  });

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = ScrollController();
  double scrollAnterior = 0.0;
//
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.width < 800) {
      count = 3;
    } else if (MediaQuery.of(context).size.width > 800) {
      count = 4;
    } else {
      count = 2;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MasonryGridView.count(
        controller: controller,
        crossAxisCount: count,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _Tile(
            index: index,
            extent: (index % 5 + 1) * 100,
          );
        },
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.index,
    required this.extent,
  });
  final int index;
  final double extent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
