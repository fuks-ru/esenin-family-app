class Config {
  final isDev = const String.fromEnvironment('ENV') == 'development';

  String get eseninBackendUrl {
    return isDev ? 'http://localhost:3001' : 'https://esenin-family.ru';
  }

  String get eseninBucketUrl {
    return isDev
        ? 'http://localhost:9000/dev-bucket'
        : 'https://minio.esenin-family.ru/esenin-family';
  }
}
