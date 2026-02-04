import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: context.colorScheme.black.withAlpha(50)),
      ),
      backgroundColor: context.colorScheme.primary,
      content: Row(
        children: [
          Icon(
            Icons.check,
            color: context.colorScheme.white,
          ),
          horizontalSpace(8),
          Text(
            message,
            style: context.textTheme.bodyMedium?.semibold.cColor(context.colorScheme.white),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(24.0),
    ),
  );
}
