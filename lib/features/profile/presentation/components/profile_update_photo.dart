import 'dart:io';
import 'dart:typed_data';

import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_snackbar.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdatePhotoSection extends StatefulWidget {
  const ProfileUpdatePhotoSection({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  State<ProfileUpdatePhotoSection> createState() => _ProfileUpdatePhotoSectionState();
}

class _ProfileUpdatePhotoSectionState extends State<ProfileUpdatePhotoSection> {
  File? selectedProfilePicture;

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (image == null) return;
    await processAndUploadSelectedImage(image: image);
  }

  Future<void> captureImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 30);

    if (image == null) return;
    await processAndUploadSelectedImage(image: image);
  }

  Future<void> processAndUploadSelectedImage({
    required XFile? image,
  }) async {
    final Uint8List imageBytes = await image?.readAsBytes() ?? Uint8List(0);
    if (imageBytes == Uint8List(0)) return;

    if (!mounted) return;
    context.read<ProfileBloc>().add(
      ProfileEvent.updateUserProfile(
        Profile(
          uid: widget.user.uid,
          firstName: widget.user.firstName,
          lastName: widget.user.lastName,
          email: widget.user.email,
          phone: widget.user.phone,
          about: widget.user.about,
          photo: imageBytes,
        ),
      ),
    );

    showCustomSnackbar(
      context: context,
      message: 'Photo updated successfully',
    );

    context.router.pop();
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
                image: DecorationImage(
                  image: widget.user.photo != null ? MemoryImage(widget.user.photo ?? Uint8List(0)) : AssetImage('assets/images/user.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            icon: Icons.camera_alt_outlined,
            label: 'Take a photo',
            onPressed: () async => captureImage(),
          ),
          verticalSpace(16),
          CustomButton(
            icon: Icons.image_outlined,
            label: 'Find in Gallery',
            onPressed: () async => pickImageFromGallery(),
          ),
        ],
      ),
    );
  }
}
