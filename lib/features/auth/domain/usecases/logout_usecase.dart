import 'package:flutter_base/core/utils/typedefs.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  FutureVoid call() => _repository.logout();
}
