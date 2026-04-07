import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({required String email, required String password, required String name});
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await _apiClient.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return UserModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<UserModel> register({required String email, required String password, required String name}) async {
    final response = await _apiClient.dio.post(
      '/auth/register',
      data: {'email': email, 'password': password, 'name': name},
    );
    return UserModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> logout() async {
    await _apiClient.dio.post('/auth/logout');
  }
}
