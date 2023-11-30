import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: 60.0,
        decoration: const BoxDecoration(
            color: Color(
          RootStyle.secondColor,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.home,
                color: Modular.to.path == '/home/'
                    ? const Color(RootStyle.primaryColor)
                    : const Color(RootStyle.stColor),
              ),
              onPressed: () => setState(() {
                Modular.to.navigate('/home');
              }),
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.ballot,
                color: Modular.to.path == '/coin/list-coin'
                    ? const Color(RootStyle.primaryColor)
                    : const Color(RootStyle.stColor),
              ),
              onPressed: () => setState(() {
                Modular.to.navigate('/coin/list-coin');
              }),
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.signal_cellular_alt,
                color: Color(RootStyle.stColor),
              ),
              onPressed: () => setState(() {
                Modular.to.navigate('/home');
              }),
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.credit_score,
                color: Modular.to.path == '/portifolio/'
                    ? const Color(RootStyle.primaryColor)
                    : const Color(RootStyle.stColor),
              ),
              onPressed: () => setState(() {
                Modular.to.navigate('/portifolio');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
