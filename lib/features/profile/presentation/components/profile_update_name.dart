import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class ProfileUpdateNameSection extends StatefulWidget {
  const ProfileUpdateNameSection({super.key});

  @override
  State<ProfileUpdateNameSection> createState() => _ProfileUpdateNameSectionState();
}

class _ProfileUpdateNameSectionState extends State<ProfileUpdateNameSection> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstNameFocusNode.requestFocus();
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
                  focusNode: firstNameFocusNode,
                  label: 'First Name',
                  hint: '',
                  controller: firstNameController,
                  textCapitalization: TextCapitalization.words,
                  onSubmitted: (value) {
                    lastNameFocusNode.requestFocus();
                  },
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: CustomTextField(
                  controller: lastNameController,
                  focusNode: lastNameFocusNode,
                  onSubmitted: (value) {},
                  label: 'Last Name',
                  hint: '',
                  textCapitalization: TextCapitalization.words,
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
