import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/root.dart';

class MiniCard extends StatelessWidget {
  final String title;
  final String label;
  final String navigation;
  final IconData icon;

  const MiniCard(
      {super.key,
      required this.label,
      required this.navigation,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 130,
        width: 160,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0x9F282e38),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: const Color(
                        RootStyle.primaryColor,
                      ),
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Veja',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Modular.to.navigate(navigation);
      },
    );
  }
}
