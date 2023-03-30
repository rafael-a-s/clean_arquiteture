import 'package:flutter/material.dart';

class BoxDecorationHome extends StatelessWidget {
  const BoxDecorationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      origin: const Offset(30, -60),
      angle: 2.4,
      child: Container(
        margin: const EdgeInsets.only(left: 75, top: 40),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [Color(0xFFfd8bab), Color(0xFFFD44C4)],
          ),
        ),
      ),
    );
  }
}
