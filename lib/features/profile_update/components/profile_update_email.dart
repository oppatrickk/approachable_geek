import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileUpdateEmailSection extends StatefulWidget {
  const ProfileUpdateEmailSection({super.key});

  @override
  State<ProfileUpdateEmailSection> createState() => _ProfileUpdateEmailSectionState();
}

class _ProfileUpdateEmailSectionState extends State<ProfileUpdateEmailSection> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
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
                ),
              ),
            ],
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
