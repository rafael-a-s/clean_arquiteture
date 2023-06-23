import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/base/skeleton/skeleton.dart';

class ListCardPortifolioSkeleton extends StatelessWidget {
  const ListCardPortifolioSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(
        top: 15,
      ),
      decoration: const BoxDecoration(
        color: Color(
          RootStyle.secondColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Skeleton(
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: const [
                  Skeleton(
                    height: 20,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Skeleton(
                    height: 15,
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
          const Skeleton(
            height: 20,
            width: 90,
          ),
        ],
      ),
    );
  }
}
