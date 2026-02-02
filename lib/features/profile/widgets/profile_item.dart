import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Column(
        children: [
          verticalSpace(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleSmall?.semibold.cColor(context.colorScheme.greyExt1),
                      ),
                      verticalSpace(8),
                      Text(
                        content,
                        style: context.textTheme.bodyLarge?.bold,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(32),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.colorScheme.grey,
                ),
              ],
            ),
          ),
          verticalSpace(8),
          Divider(
            color: context.colorScheme.greyExt1,
            height: 1,
          ),
        ],
      ),
    );
  }
}
