import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_data_model.freezed.dart';
part 'weather_data_model.g.dart';

@freezed
class WeatherDataModel with _$WeatherDataModel {
  const factory WeatherDataModel({
    required Coord coord,
    required List<Weather> weather,
    required String base,
    required Main main,
    required int visibility,
    required Wind wind,
    required Rain rain,
    required Clouds clouds,
    required int dt,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) = _WeatherDataModel;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);
}

@JsonSerializable()
class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int seaLevel;
  @JsonKey(name: 'grnd_level')
  final int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: '1h')
  final double oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
