import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color? background;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu(
      {super.key,
      this.mostrar = true,
      this.background = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModell(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: mostrar ? 1 : 0,
        child: Builder(builder: (context) {
          Provider.of<_MenuModell>(context).backgroundColor = background!;
          Provider.of<_MenuModell>(context).activeColor = activeColor!;
          Provider.of<_MenuModell>(context).inactiveColor = inactiveColor!;

          return _PinterestMenuBackground(child: _MenuItems(items));
        }),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModell>(context).backgroundColor;
    return Container(
      width: 270,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(
              spreadRadius: -5,
              blurRadius: 10,
              color: Colors.black38,
            )
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuModellProvider = Provider.of<_MenuModell>(context);

    return GestureDetector(
      onTap: () {
        menuModellProvider.itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(item.icon,
          size: menuModellProvider.itemSeleccionado == index ? 35 : 25,
          color: menuModellProvider.itemSeleccionado == index
              ? menuModellProvider.activeColor
              : menuModellProvider.inactiveColor),
    );
  }
}

class _MenuModell with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
