import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    final dynamic nextState = change.nextState;

    String nextStateString;
    if (nextState is Uint8List) {
      nextStateString = '[Bytes omitted]';
    } else if (nextState.toString().length > 500) {
      // Truncate if the string is too long
      nextStateString = '${nextState.toString().substring(0, 500)}... [Truncated]';
    } else {
      nextStateString = nextState.toString();
    }

    log('onChange(${bloc.runtimeType}, $nextStateString)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    String errorString;
    if (error is Uint8List) {
      errorString = '[Bytes omitted]';
    } else if (error.toString().length > 500) {
      errorString = '${error.toString().substring(0, 500)}... [Truncated]';
    } else {
      errorString = error.toString();
    }

    log('onError(${bloc.runtimeType}, $errorString, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runApp(await builder());
}
