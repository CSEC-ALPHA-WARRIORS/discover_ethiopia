import 'package:discover_ethiopia/constants/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_controller.g.dart';

String weatherHost = 'api.openweathermap.org';
String weatherApi = "data/2.5/weather";
String forecastAPi = "data/2.5/forecast";
String appid = "22e54ab45e2324d971afac83f3c911af";

String weatherIconUrl(String iconCode) =>
    'https://openweathermap.org/img/wn/$iconCode@4x.png';

@riverpod
Future<Map<String, dynamic>> currentWeather(Ref ref,
    {required double lat, required double lon}) async {
  var dio = ref.read(dioProvider);
  var url = Uri.https(
    weatherHost,
    weatherApi,
    {'lat': '$lat', 'lon': '$lon', "appid": appid, 'units': 'metric'},
  );
  var res = await dio.get(url.toString());
  return res.data;
}

@riverpod
Future<Map<String, dynamic>> forecastByName(Ref ref,
    {required String name}) async {
  var dio = ref.read(dioProvider);
  var url = Uri.https(
    weatherHost,
    forecastAPi,
    {'q': name, "appid": appid, 'units': 'metric'},
  );
  var res = await dio.get(url.toString());
  return res.data;
}

@riverpod
Future<Map<dynamic, dynamic>?> forecastByPosition(
  Ref ref, {
  required double lat,
  required double lon,
}) async {
  var dio = ref.read(dioProvider);
  var url = Uri.https(
    weatherHost,
    forecastAPi,
    {'lat': '$lat', 'lon': '$lon', "appid": appid, 'units': 'metric'},
  );

  var res = await dio.get(url.toString());
  List lists = res.data['list'];
  Map<dynamic, List<int>> days = {};
  lists.forEach((element) {
    String dt_txt = element['dt_txt'];
    String date = dt_txt.split(" ")[0];
    double temp = double.parse(element['main']['temp']);
    print(date);
    print(temp);
    if (days.containsKey(date)) {
      days[date]![0] += int.parse(element['main']['temp']);
      days[date]![1]++;
    } else {
      days[date] = [temp.round(), 0];
    }
  });
  return days;
}
