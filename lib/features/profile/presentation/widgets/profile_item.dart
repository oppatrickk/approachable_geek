import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/core/router/router.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/string_extension.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.type,
    required this.user,
  });

  final String title;
  final ProfileItemType type;

  final Profile user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        context.router.push(
          ProfileUpdateRoute(
            profileItemType: type,
            user: user,
          ),
        ),
      },
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
                        switch (type) {
                          ProfileItemType.name => '${user.firstName} ${user.lastName}',
                          ProfileItemType.email => user.email,
                          ProfileItemType.phone => StringExtension.formatUSPhone(user.phone),
                          ProfileItemType.about => user.about,
                          ProfileItemType.photo => '',
                        },
                        style: context.textTheme.bodyLarge?.bold,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
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
