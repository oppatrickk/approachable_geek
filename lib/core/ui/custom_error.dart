import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.error_outline_outlined, color: context.colorScheme.error),
        horizontalSpace(8),
        Text(
          message,
          style: context.textTheme.bodyLarge?.semibold.cColor(context.colorScheme.error),
        ),
      ],
    );
  }
}
