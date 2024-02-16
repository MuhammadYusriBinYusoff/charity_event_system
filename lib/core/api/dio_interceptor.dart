import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headerMessage = "";
    String bodyMessage = "";

    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    try {
      options.queryParameters.forEach(
        (k, v) => bodyMessage += '► $k: $v\n',
      );
    } catch (_) {}
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyJson = encoder.convert(options.data);
      if (const bool.fromEnvironment('VERBOSE')) {
        print(
          // ignore: unnecessary_null_comparison
          "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
          "❖ Headers:\n"
          "$headerMessage\n"
          "❖ QueryParameters : \n"
          "$bodyMessage\n"
          "Body: $prettyJson",
        );
      }
    } catch (e) {
      print("Failed to extract json request $e");
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException dioError,
    ErrorInterceptorHandler handler,
  ) async {
    print(
      "<-- ${dioError.message} "
      "${dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : (dioError.requestOptions.baseUrl + dioError.requestOptions.path)}"
      "\n\n"
      "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}",
    );

    FirebaseCrashlytics.instance.recordError(
      dioError.error,
      dioError.stackTrace,
      reason: "Failed to fetch data",
    );

    /// TODO: Handle refresh token here
    // if (dioError.response?.statusCode == 401 &&
    //     dioError.response?.data["meta"]["description"] == "Unauthenticated.") {
    //   if (sl<PrefManager>().refreshToken != null) {
    //     await refreshToken();
    //     return handler.resolve(await _retry(dioError.requestOptions));
    //   } else {
    //     sl<PrefManager>().logout();
    //   }
    // }
    return handler.next(dioError);
  }

  /// TODO: Retry the request
  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //
  //   return DioClient().dio.request<dynamic>(
  //         requestOptions.path,
  //         data: requestOptions.data,
  //         queryParameters: requestOptions.queryParameters,
  //         options: options,
  //       );
  // }

  /// TODO: Handle refresh token here
  // Future<void> refreshToken() async {
  //   /// Call API Refresh token
  //   final response = await DioClient().postRequest(
  //     ListAPI.token,
  //     data: {
  //       "clientId": environment.userClientId,
  //       "clientSecret": environment.userClientSecret,
  //       "grantType": "refresh_token",
  //       "refreshToken": sl<PrefManager>().refreshToken,
  //     },
  //     converter: (response) =>
  //         AuthTokenResponse.fromJson(response as Map<String, dynamic>),
  //   );
  //
  //   response.fold((l) => sl<PrefManager>().logout(), (r) {
  //     final data = r.data;
  //     sl<PrefManager>().authToken = "${data?.tokenType} ${data?.accessToken}";
  //     sl<PrefManager>().refreshToken =
  //         "${data?.tokenType} ${data?.refreshToken}";
  //   });
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String headerMessage = "";
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(response.data);
    if (const bool.fromEnvironment('VERBOSE')) {
      print(
        // ignore: unnecessary_null_comparison
        "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
        "❖ Headers:\n"
        "$headerMessage\n"
        "❖ Results : \n"
        "Response: $prettyJson",
      );
    }
    super.onResponse(response, handler);
  }
}