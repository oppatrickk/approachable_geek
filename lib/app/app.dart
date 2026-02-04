import 'dart:io';

import 'package:approachable_geek/app/app_colors.dart';
import 'package:approachable_geek/app/injection.dart';
import 'package:approachable_geek/core/router/logger_navigator_observer.dart';
import 'package:approachable_geek/core/router/router.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileBloc>()..add(ProfileEvent.getUserProfile())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: ColorExt.fromHex('#4169E1')),
          fontFamily: Platform.isIOS ? 'CupertinoSystemText' : 'Inter',
          extensions: <ThemeExtension<dynamic>>[
            AppColors(
              primary: ColorExt.fromHex('#4169E1'),
              background: Colors.white,
              black: Colors.black,
              white: Colors.white,
              grey: Colors.grey,
              greyExt1: Colors.grey.shade500,
              greyExt2: Colors.grey.shade300,
              error: Colors.red,
            ),
          ],
        ),
        themeMode: ThemeMode.light,
        routerConfig: appRouter.config(navigatorObservers: () => <NavigatorObserver>[LoggerNavigatorObserver(appRouter.delegate())]),
      ),
    );
  }
}
