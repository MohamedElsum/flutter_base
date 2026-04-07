import 'package:flutter_base/core/utils/typedefs.dart';
import 'package:flutter_base/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  FutureEither<UserEntity> call({required String email, required String password}) =>
      _repository.login(email: email, password: password);
}
