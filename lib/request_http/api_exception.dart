import 'dart:convert';

import 'package:muller_package/models/error_model.dart';
import 'package:muller_package/request_http/api_service.dart';

class ApiException implements Exception {
  final AppResponse response;

  ApiException(this.response);

  @override
  String toString() {
    return 'ApiException: ${response.statusCode} ${response.body}';
  }

  static ErrorModel errorModel(Object e) {
    if(e is ApiException) {
      return ErrorModel.fromMap(jsonDecode(e.response.body));
    }

    return ErrorModel.empty();
  }
}