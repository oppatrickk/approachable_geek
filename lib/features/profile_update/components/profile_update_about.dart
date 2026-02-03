import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileUpdateAboutSection extends StatefulWidget {
  const ProfileUpdateAboutSection({super.key});

  @override
  State<ProfileUpdateAboutSection> createState() => _ProfileUpdateAboutSectionState();
}

class _ProfileUpdateAboutSectionState extends State<ProfileUpdateAboutSection> {
  TextEditingController aboutController = TextEditingController();
  FocusNode aboutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      aboutFocusNode.requestFocus();
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
                  controller: aboutController,
                  focusNode: aboutFocusNode,
                  hint: 'Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.',
                  minLines: 5,
                  maxLines: 5,
                  maxLength: 500,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
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
