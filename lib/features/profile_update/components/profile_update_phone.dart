import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_error.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/input_formatter.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileUpdatePhoneSection extends StatefulWidget {
  const ProfileUpdatePhoneSection({super.key});

  @override
  State<ProfileUpdatePhoneSection> createState() => _ProfileUpdatePhoneSectionState();
}

class _ProfileUpdatePhoneSectionState extends State<ProfileUpdatePhoneSection> {
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneFocusNode.requestFocus();
    });
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
          verticalSpace(16),
          CustomError(
            message: 'Please enter a valid phone number',
          ),
          Spacer(),
          CustomButton(
            label: 'Update',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
