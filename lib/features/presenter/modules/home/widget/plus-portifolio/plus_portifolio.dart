import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlusPortifolio extends StatelessWidget {
  const PlusPortifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 40,
      decoration: const BoxDecoration(
          color: Color(RootStyle.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: IconButton(
        onPressed: () => Modular.to.navigate('/new-portifolio'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
