import 'package:custom_painters/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _MainScrollScreen(),
      const Positioned(bottom: 0, right: -10, child: _BottonNewList())
      // _Titulo(),
      // _ListadeCosas()
    ]));
  }
}

class _BottonNewList extends StatelessWidget {
  const _BottonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final themeChanger = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
        height: 70,
        minWidth: size.width * 0.9,
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          color: themeChanger.darkTheme
              ? themeChanger.currentTheme.indicatorColor
              : const Color(0xffED6762),
          onPressed: () {},
          child: Text('CREATE NEW LIST',
              style: TextStyle(
                  fontSize: 20,
                  color: themeChanger.currentTheme.scaffoldBackgroundColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3)),
        ));
  }
}

class _MainScrollScreen extends StatelessWidget {
  _MainScrollScreen();
  final items = [
    const _ListItems('Orange', Color(0xffF08F66)),
    const _ListItems('Family', Color(0xffF2A38A)),
    const _ListItems('Subscriptions', Color(0xffF7CDD5)),
    const _ListItems('Books', Color(0xffFCEBAF)),
    const _ListItems('Orange', Color(0xffF08F66)),
    const _ListItems('Family', Color(0xffF2A38A)),
    const _ListItems('Subscriptions', Color(0xffF7CDD5)),
    const _ListItems('Books', Color(0xffFCEBAF)),
    const _ListItems('Orange', Color(0xffF08F66)),
    const _ListItems('Family', Color(0xffF2A38A)),
    const _ListItems('Subscriptions', Color(0xffF7CDD5)),
    const _ListItems('Books', Color(0xffFCEBAF)),
    const _ListItems('Orange', Color(0xffF08F66)),
    const _ListItems('Family', Color(0xffF2A38A)),
    const _ListItems('Subscriptions', Color(0xffF7CDD5)),
    const _ListItems('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      slivers: [
        // const SliverAppBar(
        //   elevation: 0,
        //   floating: true,
        //   title: Text('hola'),
        //   backgroundColor: Colors.red,
        // ),

        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              maxheight: 200,
              minheight: 170,
              child: Container(
                  alignment: Alignment.centerLeft,
                  color: themeChanger.currentTheme.scaffoldBackgroundColor,
                  child: const _Titulo()),
            )),
        SliverList(
          delegate:
              SliverChildListDelegate([...items, const SizedBox(height: 90)]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});
  final double minheight;
  final double maxheight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => (minheight < maxheight) ? minheight : maxheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'New',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color:
                      themeChanger.darkTheme ? Colors.grey : Color(0xff532128)),
            )),
        Stack(
          children: [
            const SizedBox(
              width: 120,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(
                    color: themeChanger.darkTheme
                        ? Colors.white
                        : const Color(0xffF7CDD5)),
              ),
            ),
            Container(
                child: const Text(' List',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffd93a30)))),
          ],
        )
      ],
    );
  }
}

class _ListItems extends StatelessWidget {
  const _ListItems(this.titulo, this.color);
  final String titulo;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsetsDirectional.all(20),
      decoration: BoxDecoration(
          color: themeChanger.darkTheme ? Colors.lime : color,
          borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(10),
      height: 130,
      child: Text(titulo,
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}
