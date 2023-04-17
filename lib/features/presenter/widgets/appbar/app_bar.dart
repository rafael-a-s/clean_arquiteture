import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/about/image_circular.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: double.maxFinite,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            children: const <Widget>[
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
