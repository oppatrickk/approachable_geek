import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:approachable_geek/features/profile/presentation/widgets/profile_item.dart';
import 'package:approachable_geek/features/profile/presentation/widgets/profile_photo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        resizeToAvoidBottomInset: true,

        body: SafeArea(
          child: RawScrollbar(
            thumbColor: context.colorScheme.primary.withAlpha(100),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ProfileBloc>().add(const ProfileEvent.getUserProfile());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        initial: (_) => const SizedBox.shrink(),
                        loading: (ProfileLoading value) => const Center(child: CircularProgressIndicator()),
                        loaded: (ProfileLoaded value) {
                          Profile user = value.profile;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              verticalSpace(24),
                              Center(
                                child: Text(
                                  'Edit Profile',
                                  style: context.textTheme.headlineMedium?.semibold.cColor(context.colorScheme.primary),
                                ),
                              ),
                              verticalSpace(24),
                              ProfilePhoto(user: user),
                              verticalSpace(24),
                              ProfileItem(
                                user: user,
                                type: ProfileItemType.name,
                                title: 'Name',
                              ),
                              ProfileItem(
                                user: user,
                                type: ProfileItemType.phone,
                                title: 'Phone',
                              ),
                              ProfileItem(
                                user: user,
                                type: ProfileItemType.email,
                                title: 'Email',
                              ),
                              ProfileItem(
                                user: user,
                                type: ProfileItemType.about,
                                title: 'Tell us about yourself',
                              ),
                              verticalSpace(24),
                            ],
                          );
                        },
                        error: (ProfileError value) => Center(child: ErrorWidget(value.message)),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
