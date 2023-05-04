import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Color(RootStyle.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'MINHA CARTEIRA',
                style: TextStyle(
                    color: Color(RootStyle.ptColor),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$ 1,929.21',
                style: TextStyle(
                  color: Color(RootStyle.ptColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
              Text(
                '+ 0,5%',
                style: TextStyle(
                    color: Color(RootStyle.ptColor),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.trending_up,
                size: 40,
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}
