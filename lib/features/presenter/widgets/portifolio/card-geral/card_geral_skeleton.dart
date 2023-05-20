import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/base/skeleton/skeleton.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkeletonCardGeralPortifolio extends StatelessWidget {
  const SkeletonCardGeralPortifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(
          0xFF22282C,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Skeleton(
                height: 20,
                width: 200,
              ),
              Skeleton(
                height: 30,
                width: 200,
              ),
              Skeleton(
                height: 20,
                width: 150,
              ),
              Skeleton(
                height: 25,
                width: 70,
              ),
              Skeleton(
                height: 20,
                width: 100,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Skeleton(
                    height: 15,
                    width: 20,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: Color(RootStyle.ptColor),
                  ),
                ],
              ),
              const Skeleton(
                height: 60,
                width: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
