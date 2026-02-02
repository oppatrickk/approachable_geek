import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/widgets/profile_item.dart';
import 'package:flutter/material.dart';

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
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 128,
                          width: 128,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.colorScheme.primary,
                              width: 6,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/user.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: 12,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colorScheme.white,
                              boxShadow: [
                                BoxShadow(
                                  color: context.colorScheme.black.withAlpha(50),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: context.colorScheme.primary,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    ProfileItem(
                      title: 'Name',
                      content: 'Micah Smith',
                    ),
                    ProfileItem(
                      title: 'Phone',
                      content: 'Micah Smith',
                    ),
                    ProfileItem(
                      title: 'Email',
                      content: 'Micah Smith',
                    ),
                    ProfileItem(
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
