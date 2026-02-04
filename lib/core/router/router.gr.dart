// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ProfileUpdatePage]
class ProfileUpdateRoute extends PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    Key? key,
    required ProfileItemType profileItemType,
    required Profile user,
    List<PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(
           key: key,
           profileItemType: profileItemType,
           user: user,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return ProfileUpdatePage(
        key: args.key,
        profileItemType: args.profileItemType,
        user: args.user,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({
    this.key,
    required this.profileItemType,
    required this.user,
  });

  final Key? key;

  final ProfileItemType profileItemType;

  final Profile user;

  @override
  String toString() {
    return 'ProfileUpdateRouteArgs{key: $key, profileItemType: $profileItemType, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileUpdateRouteArgs) return false;
    return key == other.key &&
        profileItemType == other.profileItemType &&
        user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ profileItemType.hashCode ^ user.hashCode;
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
