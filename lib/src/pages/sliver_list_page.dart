import 'package:flutter/material.dart';

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
    return ButtonTheme(
        height: 70,
        minWidth: size.width * 0.9,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          color: const Color(0xffED6762),
          onPressed: () {},
          child: const Text('CREATE NEW LIST',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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
                  color: Colors.white,
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
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: const Text(
              'New',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff532128)),
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
                decoration: const BoxDecoration(color: Color(0xffF7CDD5)),
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

class _ListadeCosas extends StatelessWidget {
  final items = [
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
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index]);
  }
}

class _ListItems extends StatelessWidget {
  const _ListItems(this.titulo, this.color);
  final String titulo;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsetsDirectional.all(20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(10),
      height: 130,
      child: Text(titulo,
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}
