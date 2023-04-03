import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/about/image_circular.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( right: 15),
      width: double.maxFinite,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          
          Column(
            children: [
              Text('Rafael.dev'),
              Text('Rafael Aguiar Silva')
            ],
          ),
         ImageCircle(),
        ],
      ),
    );
  }

}
