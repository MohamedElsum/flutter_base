import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class HiveStorage {
  static const String _boxName = 'app_storage';
  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  static T? get<T>(String key) => _box.get(key) as T?;

  static Future<void> put<T>(String key, T value) => _box.put(key, value);

  static Future<void> delete(String key) => _box.delete(key);

  static bool has(String key) => _box.containsKey(key);

  static Future<void> clear() => _box.clear();
}
