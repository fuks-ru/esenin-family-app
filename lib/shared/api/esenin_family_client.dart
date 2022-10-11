import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:esenin_family/shared/config/config.dart';
import 'package:esenin_family_client/esenin_family_client.dart';

Dio createDio(BaseOptions baseConfiguration) {
  var dio = Dio(baseConfiguration);

  var adapter = BrowserHttpClientAdapter();
  adapter.withCredentials = true;
  dio.httpClientAdapter = adapter;

  return dio;
}

BaseOptions createDioOptions(
    String baseUrl, int connectionTimeout, int connectionReadTimeout) {
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectionTimeout,
    receiveTimeout: connectionReadTimeout,
  );
}

DefaultApi createEseninFamilyApi() {
  final baseUrl = Config().eseninBackendUrl;
  final options = createDioOptions(baseUrl, 10000, 10000);
  final dio = createDio(options);
  final client = EseninFamilyClient(dio: dio);

  return client.getDefaultApi();
}
