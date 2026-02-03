import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/presentation/components/profile_update_about.dart';
import 'package:approachable_geek/features/profile/presentation/components/profile_update_email.dart';
import 'package:approachable_geek/features/profile/presentation/components/profile_update_name.dart';
import 'package:approachable_geek/features/profile/presentation/components/profile_update_phone.dart';
import 'package:approachable_geek/features/profile/presentation/components/profile_update_photo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({
    super.key,
    required this.profileItemType,
  });

  final ProfileItemType profileItemType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: context.colorScheme.black,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: context.colorScheme.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                profileItemType.heading,
                style: context.textTheme.headlineSmall?.semibold.cColor(context.colorScheme.black),
              ),
              verticalSpace(32),
              buildSections(profileItemType),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSections(ProfileItemType profileItemType) {
    switch (profileItemType) {
      case ProfileItemType.name:
        return ProfileUpdateNameSection();
      case ProfileItemType.phone:
        return ProfileUpdatePhoneSection();
      case ProfileItemType.email:
        return ProfileUpdateEmailSection();
      case ProfileItemType.about:
        return ProfileUpdateAboutSection();
      case ProfileItemType.photo:
        return ProfileUpdatePhotoSection();
    }
  }
}
