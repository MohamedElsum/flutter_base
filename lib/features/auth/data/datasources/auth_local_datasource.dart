import 'package:flutter_base/core/storage/hive_storage.dart';
import 'package:flutter_base/core/storage/storage_keys.dart';
import 'package:flutter_base/features/auth/data/models/user_model.dart';
import 'dart:convert';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  String? getToken();
  Future<void> cacheUser(UserModel user);
  UserModel? getCachedUser();
  Future<void> clearAuth();
  bool isLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheToken(String token) =>
      HiveStorage.put(StorageKeys.accessToken, token);

  @override
  String? getToken() => HiveStorage.get<String>(StorageKeys.accessToken);

  @override
  Future<void> cacheUser(UserModel user) =>
      HiveStorage.put('cached_user', jsonEncode(user.toJson()));

  @override
  UserModel? getCachedUser() {
    final data = HiveStorage.get<String>('cached_user');
    if (data == null) return null;
    return UserModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }

  @override
  Future<void> clearAuth() async {
    await HiveStorage.delete(StorageKeys.accessToken);
    await HiveStorage.delete(StorageKeys.refreshToken);
    await HiveStorage.delete('cached_user');
  }

  @override
  bool isLoggedIn() => HiveStorage.has(StorageKeys.accessToken);
}
