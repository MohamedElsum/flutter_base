import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/storage/hive_storage.dart';
import 'package:flutter_base/core/storage/storage_keys.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_loadLocale());

  static Locale _loadLocale() {
    final stored = HiveStorage.get<String>(StorageKeys.locale);
    return Locale(stored ?? 'en');
  }

  void setLocale(Locale locale) {
    HiveStorage.put(StorageKeys.locale, locale.languageCode);
    emit(locale);
  }

  void toggleLocale() {
    final newLocale = state.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    setLocale(newLocale);
  }
}
