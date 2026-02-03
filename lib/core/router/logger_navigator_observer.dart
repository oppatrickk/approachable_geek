import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  LoggerNavigatorObserver(this.delegate);
  final AutoRouterDelegate delegate;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'pop');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logNavigation(newRoute.settings.name, 'replace');
    }
  }

  void _logNavigation(String? routeName, String action) {
    if (routeName != null) {
      log('Screen $action: $routeName', name: 'Navigation');
      final String fullPath = delegate.urlState.path;
      log(fullPath, name: 'Navigation');
    }
  }
}
