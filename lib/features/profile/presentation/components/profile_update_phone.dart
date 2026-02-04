import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_error.dart';
import 'package:approachable_geek/core/ui/custom_snackbar.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/input_formatter.dart';
import 'package:approachable_geek/core/utils/string_extension.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdatePhoneSection extends StatefulWidget {
  const ProfileUpdatePhoneSection({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  State<ProfileUpdatePhoneSection> createState() => _ProfileUpdatePhoneSectionState();
}

class _ProfileUpdatePhoneSectionState extends State<ProfileUpdatePhoneSection> {
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();

  String? initialPhoneNumber;
  bool? hasError;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneNumberController.text = StringExtension.formatUSPhone(widget.user.phone);
      initialPhoneNumber = StringExtension.formatUSPhone(widget.user.phone);

      phoneNumberController.addListener(onPhoneChanged);
      phoneFocusNode.requestFocus();
    });
  }

  void onPhoneChanged() {
    setState(() {
      hasError = false;
    });
  }

  bool get _isChanged {
    final phoneNumberChanged = phoneNumberController.text.trim() != initialPhoneNumber;
    final isNotEmpty = phoneNumberController.text.trim().isNotEmpty;
    return phoneNumberChanged && isNotEmpty;
  }

  @override
  void dispose() {
    phoneNumberController.removeListener(onPhoneChanged);
    phoneNumberController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (phoneNumberController.text.length < 14) {
      setState(() => hasError = true);
      return;
    }

    final rawDigits = phoneNumberController.text.replaceAll(RegExp(r'[^\d]'), '');

    final e164PhoneNumber = '+$rawDigits';

    context.read<ProfileBloc>().add(
      ProfileEvent.updateUserProfile(
        Profile(
          uid: widget.user.uid,
          firstName: widget.user.firstName,
          lastName: widget.user.lastName,
          email: widget.user.email,
          phone: e164PhoneNumber,
          about: widget.user.about,
          photo: widget.user.photo,
        ),
      ),
    );

    showCustomSnackbar(
      context: context,
      message: 'Phone updated successfully',
    );

    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: phoneNumberController,
                  focusNode: phoneFocusNode,
                  hint: '(000) 000-0000',
                  label: 'Your Phone Number',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    USPhoneInputFormatter(),
                    LengthLimitingTextInputFormatter(14),
                  ],
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
          if (hasError == true) ...[
            verticalSpace(16),
            CustomError(
              message: 'Please enter a valid phone number',
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
