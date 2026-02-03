import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/presentation/widgets/profile_item.dart';
import 'package:approachable_geek/features/profile/presentation/widgets/profile_photo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        resizeToAvoidBottomInset: true,

        body: SafeArea(
          child: RawScrollbar(
            thumbColor: context.colorScheme.primary.withAlpha(100),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(24),
                    Center(
                      child: Text(
                        'Edit Profile',
                        style: context.textTheme.headlineMedium?.semibold.cColor(context.colorScheme.primary),
                      ),
                    ),
                    verticalSpace(24),
                    ProfilePhoto(),
                    verticalSpace(24),
                    ProfileItem(
                      type: ProfileItemType.name,
                      title: 'Name',
                      content: 'Micah Smith',
                    ),
                    ProfileItem(
                      type: ProfileItemType.phone,
                      title: 'Phone',
                      content: '(208) 206-5039',
                    ),
                    ProfileItem(
                      type: ProfileItemType.email,
                      title: 'Email',
                      content: 'micahsmith@gmail.com',
                    ),
                    ProfileItem(
                      type: ProfileItemType.about,
                      title: 'Tell us about yourself',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
