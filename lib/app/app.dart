import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base/core/localization/generated/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_base/app/router/app_router.dart';
import 'package:flutter_base/core/di/injection_container.dart';
import 'package:flutter_base/core/theme/app_theme.dart';
import 'package:flutter_base/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_base/core/localization/cubit/locale_cubit.dart';
import 'package:flutter_base/features/auth/presentation/cubit/auth_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeCubit>()),
        BlocProvider(create: (_) => sl<LocaleCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              final appRouter = AppRouter();
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Base',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerConfig: appRouter.router,
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
