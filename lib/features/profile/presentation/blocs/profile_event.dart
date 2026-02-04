part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getUserProfile() = _GetUserProfile;
  const factory ProfileEvent.updateUserProfile(Profile profile) = _UpdateUserProfile;
}
