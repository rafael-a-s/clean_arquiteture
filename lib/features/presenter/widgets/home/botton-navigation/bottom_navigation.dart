import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              icon: const Icon(
                Icons.home,
                color: Color(RootStyle.primaryColor),
              ),
              onPressed: () => Modular.to.navigate('/'),
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.ballot,
                color: Color(RootStyle.stColor),
              ),
              onPressed: () => Modular.to.navigate('/list-coin'),
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.signal_cellular_alt,
                color: Color(RootStyle.stColor),
              ),
              onPressed: () => Modular.to.navigate('/'),
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.credit_score,
                color: Color(RootStyle.stColor),
              ),
              onPressed: () => Modular.to.navigate('/portifolio'),
            ),
          ],
        ),
      ),
    );
  }
}
