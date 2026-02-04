import 'package:approachable_geek/core/ui/custom_shimmer.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        verticalSpace(24),
        Center(
          child: CustomShimmer(
            height: 42,
            width: screenWidthFraction(context, dividedBy: 2.5),
            borderRadius: 32,
          ),
        ),
        verticalSpace(24),
        CustomShimmer(
          height: 128,
          width: 128,
          shape: BoxShape.circle,
        ),
        verticalSpace(48),
        CustomShimmer(height: 54),
        verticalSpace(16),
        CustomShimmer(height: 54),
        verticalSpace(16),
        CustomShimmer(height: 54),
        verticalSpace(16),
        CustomShimmer(height: 96),
      ],
    );
  }
}
