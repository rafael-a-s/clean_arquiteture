import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(RootStyle.defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
