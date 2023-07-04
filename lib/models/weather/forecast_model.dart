import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@freezed
class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    required int dt,
    required ForecastMain main,
    required List<Forecast> weather,
    required ForecastClouds clouds,
    required ForecastWind wind,
    required int visibility,
    required double pop,
    required ForecastRain rain,
    required ForecastSys sys,
    required String dtTxt,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}

@JsonSerializable()
class ForecastMain {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  @JsonKey(name: 'sea_level')
  final int seaLevel;
  @JsonKey(name: 'grnd_level')
  final int grndLevel;
  final int humidity;
  @JsonKey(name: 'temp_kf')
  final double tempKf;

  ForecastMain({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory ForecastMain.fromJson(Map<String, dynamic> json) =>
      _$ForecastMainFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastMainToJson(this);
}

@JsonSerializable()
class Forecast {
  final int id;
  final String main;
  final String description;
  final String icon;

  Forecast({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class ForecastClouds {
  final int all;

  ForecastClouds({required this.all});

  factory ForecastClouds.fromJson(Map<String, dynamic> json) =>
      _$ForecastCloudsFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastCloudsToJson(this);
}

@JsonSerializable()
class ForecastWind {
  final double speed;
  final int deg;
  final double gust;

  ForecastWind({required this.speed, required this.deg, required this.gust});

  factory ForecastWind.fromJson(Map<String, dynamic> json) =>
      _$ForecastWindFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastWindToJson(this);
}

@JsonSerializable()
class ForecastRain {
  @JsonKey(name: '3h')
  final double threeHours;

  ForecastRain({required this.threeHours});

  factory ForecastRain.fromJson(Map<String, dynamic> json) =>
      _$ForecastRainFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastRainToJson(this);
}

@JsonSerializable()
class ForecastSys {
  final String pod;

  ForecastSys({required this.pod});

  factory ForecastSys.fromJson(Map<String, dynamic> json) =>
      _$ForecastSysFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastSysToJson(this);
}
