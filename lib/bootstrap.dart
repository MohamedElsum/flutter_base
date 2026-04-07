import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/app/app.dart';
import 'package:flutter_base/app/app_bloc_observer.dart';
import 'package:flutter_base/config/env/app_env.dart';
import 'package:flutter_base/core/di/injection_container.dart';
import 'package:flutter_base/core/error/error_handler.dart';
import 'package:flutter_base/core/storage/hive_storage.dart';

Future<void> bootstrap() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      ErrorHandler.init();
      Bloc.observer = AppBlocObserver();

      await AppEnv.init();
      await HiveStorage.init();
      await initDependencies();

      runApp(const App());
    },
    ErrorHandler.handleError,
  );
}
