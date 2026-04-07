import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_base/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_base/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_base/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        super(const AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const Unauthenticated()),
    );
  }

  void setAuthenticated(UserEntity user) => emit(Authenticated(user));
  void setUnauthenticated() => emit(const Unauthenticated());
}
