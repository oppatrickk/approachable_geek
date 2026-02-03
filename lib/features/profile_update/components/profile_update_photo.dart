import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePhotoSection extends StatefulWidget {
  const ProfileUpdatePhotoSection({super.key});

  @override
  State<ProfileUpdatePhotoSection> createState() => _ProfileUpdatePhotoSectionState();
}

class _ProfileUpdatePhotoSectionState extends State<ProfileUpdatePhotoSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(16),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 6,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/user.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            icon: Icons.camera_alt_outlined,
            label: 'Take a photo',
            onPressed: () {},
          ),
          verticalSpace(16),
          CustomButton(
            icon: Icons.image_outlined,
            label: 'Find in Gallery',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
