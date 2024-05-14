enum EnvType { dev, prod }

class AppConstants {
  static const String baseURL =
      'https://pet-home-api-production.up.railway.app/api/v1';
  static const isProd = bool.fromEnvironment('isProd');
  static const forceLogs = bool.fromEnvironment('forceLogs');

  static final envType = getEnvType;

  static EnvType get getEnvType {
    if (isProd) {
      return EnvType.prod;
    } else {
      return EnvType.dev;
    }
  }
}
