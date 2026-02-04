import 'dart:async';

import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:approachable_geek/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getUserProfile, this._updateUserProfile) : super(const ProfileState.initial()) {
    on<_GetUserProfile>(_onGetUserProfile);
    on<_UpdateUserProfile>(_onUpdateUserProfile);
  }
  final GetUserProfile _getUserProfile;
  final UpdateUserProfile _updateUserProfile;

  Future<void> _onGetUserProfile(_GetUserProfile event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final fetchedUserProfile = await _getUserProfile();

      // * Just to simulate it loading from the server
      await Future.delayed(const Duration(seconds: 2), () {});
      emit(ProfileState.loaded(profile: fetchedUserProfile));
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onUpdateUserProfile(_UpdateUserProfile event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());

    final result = await _updateUserProfile(
      UpdateUserProfileParams(
        uid: event.profile.uid,
        firstName: event.profile.firstName.trim(),
        lastName: event.profile.lastName.trim(),
        email: event.profile.email,
        phone: event.profile.phone,
        about: event.profile.about,
        photo: event.profile.photo,
      ),
    );

    result.fold(
      (failure) => emit(ProfileState.error('Failed to update profile')),
      (_) => emit(ProfileState.loaded(profile: event.profile)),
    );
  }
}
