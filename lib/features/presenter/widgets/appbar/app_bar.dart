import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/about/image_circular.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, top: 5, left: 15),
      width: double.maxFinite,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            children: const <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                'Rafael.dev',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Rafael Aguiar Silva',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          ImageCircle(),
        ],
      ),
    );
  }
}
