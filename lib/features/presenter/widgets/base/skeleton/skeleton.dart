import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_app/features/presenter/root.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.isCircle})
      : super(key: key);

  final double? height, width;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(RootStyle.defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: const BorderRadius.all(
            Radius.circular(RootStyle.defaultPadding),
          ),
        ),
      ),
    );
  }
}
