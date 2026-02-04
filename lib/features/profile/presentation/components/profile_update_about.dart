import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_snackbar.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateAboutSection extends StatefulWidget {
  const ProfileUpdateAboutSection({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  State<ProfileUpdateAboutSection> createState() => _ProfileUpdateAboutSectionState();
}

class _ProfileUpdateAboutSectionState extends State<ProfileUpdateAboutSection> {
  TextEditingController aboutController = TextEditingController();
  FocusNode aboutFocusNode = FocusNode();

  String? initialAbout;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      aboutController.text = widget.user.about;
      initialAbout = widget.user.about;

      aboutController.addListener(onAboutChanged);

      aboutFocusNode.requestFocus();
    });
  }

  void onAboutChanged() {
    setState(() {});
  }

  bool get _isChanged {
    final aboutChanged = aboutController.text.trim() != initialAbout;
    final isNotEmpty = aboutController.text.trim().isNotEmpty;
    return aboutChanged && isNotEmpty;
  }

  @override
  void dispose() {
    aboutController.removeListener(onAboutChanged);
    aboutController.dispose();
    aboutFocusNode.dispose();
    super.dispose();
  }

  void onSubmit() {
    context.read<ProfileBloc>().add(
      ProfileEvent.updateUserProfile(
        Profile(
          uid: widget.user.uid,
          firstName: widget.user.firstName,
          lastName: widget.user.lastName,
          email: widget.user.email,
          phone: widget.user.phone,
          about: aboutController.text.trim(),
          photo: widget.user.photo,
        ),
      ),
    );

    showCustomSnackbar(
      context: context,
      message: 'About updated successfully',
    );

    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: aboutController,
                  focusNode: aboutFocusNode,
                  hint: 'Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.',
                  minLines: 5,
                  maxLines: 5,
                  maxLength: 200,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            enabled: _isChanged,
            label: 'Update',
            onPressed: () => onSubmit(),
          ),
        ],
      ),
    );
  }
}
