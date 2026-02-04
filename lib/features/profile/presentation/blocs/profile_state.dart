part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  factory ProfileState.loaded({required Profile profile}) = ProfileLoaded;
  const factory ProfileState.error(String message) = ProfileError;
}
