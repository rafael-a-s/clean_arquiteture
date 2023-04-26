import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/about/image_circular.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 15),
      width: double.maxFinite,
      height: 115,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Olá,',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rafael Aguiar',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          ImageCircle(),
        ],
      ),
    );
  }
}
