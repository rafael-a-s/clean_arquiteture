import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';

class PlusPortifolio extends StatelessWidget {
  const PlusPortifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 40,
      decoration: const BoxDecoration(
          color: Color(0xFF9b9bdd),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Icon(Icons.add),
    );
  }
}
