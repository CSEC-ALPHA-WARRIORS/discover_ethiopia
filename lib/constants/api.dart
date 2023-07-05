import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api.g.dart';

String baseURL = 'https://madd-dummy-api.vercel.app/api';
String phpUrl = 'https://flutterprojectapiaaaaa.000webhostapp.com';

@riverpod
Dio dio(Ref ref) {
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return dio;
}
