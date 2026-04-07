import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, staging, prod }

class AppEnv {
  static late Environment _environment;

  static Environment get environment => _environment;
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static bool get isDev => _environment == Environment.dev;
  static bool get isStaging => _environment == Environment.staging;
  static bool get isProd => _environment == Environment.prod;

  static Future<void> init() async {
    const envString = String.fromEnvironment('ENV', defaultValue: 'dev');
    _environment = Environment.values.firstWhere(
      (e) => e.name == envString,
      orElse: () => Environment.dev,
    );

    await dotenv.load(fileName: '.env.${_environment.name}');
  }
}
