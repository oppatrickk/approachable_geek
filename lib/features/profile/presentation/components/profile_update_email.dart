import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_error.dart';
import 'package:approachable_geek/core/ui/custom_snackbar.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/input_formatter.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateEmailSection extends StatefulWidget {
  const ProfileUpdateEmailSection({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  State<ProfileUpdateEmailSection> createState() => _ProfileUpdateEmailSectionState();
}

class _ProfileUpdateEmailSectionState extends State<ProfileUpdateEmailSection> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  String? initialEmail;
  bool? hasError;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailController.text = widget.user.email;
      initialEmail = widget.user.email;

      emailController.addListener(onEmailChanged);

      emailFocusNode.requestFocus();
    });
  }

  void onEmailChanged() {
    setState(() {
      hasError = false;
    });
  }

  @override
  void dispose() {
    emailController.removeListener(onEmailChanged);
    emailController.dispose();
    super.dispose();
  }

  bool get _isChanged {
    final emailChanged = initialEmail != emailController.text.trim();
    final isNotEmpty = emailController.text.trim().isNotEmpty;
    return emailChanged && isNotEmpty;
  }

  void onSubmit() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(emailController.text.trim())) {
      setState(() => hasError = true);
      return;
    }

    context.read<ProfileBloc>().add(
      ProfileEvent.updateUserProfile(
        Profile(
          uid: widget.user.uid,
          firstName: widget.user.firstName,
          lastName: widget.user.lastName,
          email: emailController.text.trim(),
          phone: widget.user.phone,
          about: widget.user.about,
          photo: widget.user.photo,
        ),
      ),
    );

    showCustomSnackbar(
      context: context,
      message: 'Email updated successfully',
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
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    LengthLimitingTextInputFormatter(50),
                    LowerCaseTextFormatter(),
                  ],
                  label: 'Your Email Address',
                  hint: 'hello@approachablegeek.com',
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) => onSubmit(),
                ),
              ),
            ],
          ),
          if (hasError == true) ...[
            verticalSpace(16),
            CustomError(
              message: 'Please enter a valid email address',
            ),
          ],
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
