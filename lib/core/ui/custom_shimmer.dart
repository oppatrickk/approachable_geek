import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.width,
    this.height,
    this.borderRadius,
    this.shape,
  });

  final Color? baseColor;
  final Color? highlightColor;

  final double? width;
  final double? height;

  final double? borderRadius;

  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? context.colorScheme.greyExt2,
      highlightColor: highlightColor ?? context.colorScheme.background,
      period: const Duration(seconds: 1),
      child: Container(
        width: width ?? screenWidth(context),
        height: height ?? 32,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          color: context.colorScheme.greyExt2,
          borderRadius: shape != null ? null : BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
    );
  }
}
