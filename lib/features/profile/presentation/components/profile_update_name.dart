import 'package:approachable_geek/core/ui/custom_button.dart';
import 'package:approachable_geek/core/ui/custom_snackbar.dart';
import 'package:approachable_geek/core/ui/custom_text_field.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateNameSection extends StatefulWidget {
  const ProfileUpdateNameSection({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  State<ProfileUpdateNameSection> createState() => _ProfileUpdateNameSectionState();
}

class _ProfileUpdateNameSectionState extends State<ProfileUpdateNameSection> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();

  String? initialFirstName;
  String? initialLastName;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstNameController.text = widget.user.firstName;
      lastNameController.text = widget.user.lastName;

      initialFirstName = widget.user.firstName;
      initialLastName = widget.user.lastName;

      firstNameController.addListener(onTextChanged);
      lastNameController.addListener(onTextChanged);

      firstNameFocusNode.requestFocus();
    });
  }

  void onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    firstNameController.removeListener(onTextChanged);
    lastNameController.removeListener(onTextChanged);
    firstNameController.dispose();
    lastNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  bool get _isChanged {
    final nameChanged = firstNameController.text != initialFirstName || lastNameController.text != initialLastName;
    final isNotEmpty = firstNameController.text.trim().isNotEmpty && lastNameController.text.trim().isNotEmpty;
    return nameChanged && isNotEmpty;
  }

  void onSubmit() {
    context.read<ProfileBloc>().add(
      ProfileEvent.updateUserProfile(
        Profile(
          uid: widget.user.uid,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: widget.user.email,
          phone: widget.user.phone,
          about: widget.user.about,
          photo: widget.user.photo,
        ),
      ),
    );

    showCustomSnackbar(
      context: context,
      message: 'Name updated successfully',
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
                  onSubmitted: (value) async => onSubmit(),
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
            enabled: _isChanged,
            label: 'Update',
            onPressed: () async => onSubmit(),
          ),
        ],
      ),
    );
  }
}
