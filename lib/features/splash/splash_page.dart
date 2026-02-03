import 'package:approachable_geek/core/router/router.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.router.replace(const ProfileRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Approachable Geek',
                      style: context.textTheme.headlineMedium?.semibold.cColor(context.colorScheme.primary),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(8),
                    Text(
                      'Coding Project',
                      style: context.textTheme.headlineSmall?.semibold.cColor(context.colorScheme.greyExt1),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Text(
                'John Patrick Prieto',
                style: context.textTheme.titleLarge?.bold.cColor(context.colorScheme.black),
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
