import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_base/core/localization/cubit/locale_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => context.read<LocaleCubit>().toggleLocale(),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Page - Start building your app!'),
      ),
    );
  }
}
