import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/base/skeleton/skeleton.dart';

class ContainerCardSkeleton extends StatelessWidget {
  const ContainerCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(
            RootStyle.primaryColor,
          ).withOpacity(0.7),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Skeleton(
                height: 15,
                width: 30,
              ),
            ],
          ),
          const Skeleton(
            height: 45,
            width: 125,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
              Skeleton(
                height: 15,
                width: 30,
              ),
              Skeleton(
                height: 40,
                width: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
