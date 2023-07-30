import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const CustomShimmer.circular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: context.cardColor!.withOpacity(0.03),
        highlightColor: context.cardColor!.withOpacity(0.7),
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: context.cardColor!.withOpacity(0.5),
            shape: shapeBorder,
          ),
        ),
      );
}
