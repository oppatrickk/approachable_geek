import 'package:approachable_geek/core/enums/profile_item_type.dart';
import 'package:approachable_geek/features/profile/profile_page.dart';
import 'package:approachable_geek/features/profile_update/profile_update_page.dart';
import 'package:approachable_geek/features/splash/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/profile',
      page: ProfileRoute.page,
    ),
    CustomRoute<dynamic>(
      page: ProfileUpdateRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
  ];

  // * Default page transition
  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: TransitionsBuilders.slideTop,
    duration: Duration(milliseconds: 500),
  );
}
