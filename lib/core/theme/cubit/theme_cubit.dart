import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/storage/hive_storage.dart';
import 'package:flutter_base/core/storage/storage_keys.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_loadTheme());

  static ThemeMode _loadTheme() {
    final stored = HiveStorage.get<String>(StorageKeys.themeMode);
    return switch (stored) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  void setTheme(ThemeMode mode) {
    HiveStorage.put(StorageKeys.themeMode, mode.name);
    emit(mode);
  }

  void toggleTheme() {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setTheme(newMode);
  }
}
