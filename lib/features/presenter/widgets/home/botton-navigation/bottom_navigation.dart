import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';

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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(RootStyle.secondColor),
              Color(0xFF182035),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.add,
                color: Color(0xFF949fb3),
              ),
              onPressed: () => {},
            ),
            IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.streetview,
                color: Color(0xFF949fb3),
              ),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
