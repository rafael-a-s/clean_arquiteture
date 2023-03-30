import 'dart:ffi';

import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final String label;
  final String image;
  final int color;

  const MiniCard(
      {super.key,
      required this.color,
      required this.image,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0x9F282e38),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: TextStyle(
                color: Color(color),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
