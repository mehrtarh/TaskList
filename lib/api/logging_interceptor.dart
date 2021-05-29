import 'package:dio/dio.dart';

class LoggingInterceptor extends InterceptorsWrapper {

  LoggingInterceptor();
  int maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) {

    print("--> ${options.method} ${options.path}");
    print("Content type: ${options.contentType}");
    print("<-- END HTTP");

    super.onRequest(options,handler);
  }

  @override
  void onResponse(Response response,ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }

    print("<-- END HTTP");

     super.onResponse(response,handler);
  }

  @override
  void onError(DioError err,ErrorInterceptorHandler handler,) {
    print("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err,handler);
  }
}
