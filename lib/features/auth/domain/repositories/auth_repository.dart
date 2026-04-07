import 'package:flutter_base/core/utils/typedefs.dart';
import 'package:flutter_base/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  FutureEither<UserEntity> login({required String email, required String password});
  FutureEither<UserEntity> register({required String email, required String password, required String name});
  FutureEither<void> logout();
  FutureEither<UserEntity?> getCurrentUser();
  Future<bool> isLoggedIn();
}
