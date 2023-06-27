import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/base/circel-skeleton/circle_skeleton.dart';
import 'package:my_app/features/presenter/widgets/base/skeleton/skeleton.dart';

class GraphPortifolioSkeleton extends StatefulWidget {
  GraphPortifolioSkeleton({
    super.key,
  });

  @override
  State<GraphPortifolioSkeleton> createState() =>
      _GraphPortifolioSkeletonState();
}

class _GraphPortifolioSkeletonState extends State<GraphPortifolioSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleSkeleton(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          children: const [
            Skeleton(
              height: 25,
              width: 75,
            ),
            Skeleton(
              height: 25,
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}
