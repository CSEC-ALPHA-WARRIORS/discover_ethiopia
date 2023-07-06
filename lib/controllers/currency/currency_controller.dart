import 'package:dio/dio.dart';
import 'package:discover_ethiopia/constants/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_controller.g.dart';

var currencyToken = "4a1477cec2mshf791c739f56aebep17f8d2jsndf5ed545bec2";

@riverpod
Future<double> rate(Ref ref,
    {required String have, required String want}) async {
  var currencyApi = Uri.https("currency-converter-by-api-ninjas.p.rapidapi.com",
      "/v1/convertcurrency", {"have": have, "want": want, "amount": "1"});
  var dio = ref.read(dioProvider);
  var res = await dio.get(
    currencyApi.toString(),
    options: Options(
      headers: {
        'X-RapidAPI-Key': currencyToken,
        'X-RapidAPI-Host': 'currency-converter-by-api-ninjas.p.rapidapi.com'
      },
    ),
  );
  double r = res.data['new_amount'];
  return r;
}
