// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastMain _$ForecastMainFromJson(Map<String, dynamic> json) => ForecastMain(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      seaLevel: json['sea_level'] as int,
      grndLevel: json['grnd_level'] as int,
      humidity: json['humidity'] as int,
      tempKf: (json['temp_kf'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastMainToJson(ForecastMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
      'humidity': instance.humidity,
      'temp_kf': instance.tempKf,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

ForecastClouds _$ForecastCloudsFromJson(Map<String, dynamic> json) =>
    ForecastClouds(
      all: json['all'] as int,
    );

Map<String, dynamic> _$ForecastCloudsToJson(ForecastClouds instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

ForecastWind _$ForecastWindFromJson(Map<String, dynamic> json) => ForecastWind(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'] as int,
      gust: (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastWindToJson(ForecastWind instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

ForecastRain _$ForecastRainFromJson(Map<String, dynamic> json) => ForecastRain(
      threeHours: (json['3h'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastRainToJson(ForecastRain instance) =>
    <String, dynamic>{
      '3h': instance.threeHours,
    };

ForecastSys _$ForecastSysFromJson(Map<String, dynamic> json) => ForecastSys(
      pod: json['pod'] as String,
    );

Map<String, dynamic> _$ForecastSysToJson(ForecastSys instance) =>
    <String, dynamic>{
      'pod': instance.pod,
    };

_$_ForecastModel _$$_ForecastModelFromJson(Map<String, dynamic> json) =>
    _$_ForecastModel(
      dt: json['dt'] as int,
      main: ForecastMain.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: ForecastClouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: ForecastWind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      pop: (json['pop'] as num).toDouble(),
      rain: ForecastRain.fromJson(json['rain'] as Map<String, dynamic>),
      sys: ForecastSys.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dtTxt'] as String,
    );

Map<String, dynamic> _$$_ForecastModelToJson(_$_ForecastModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'rain': instance.rain,
      'sys': instance.sys,
      'dtTxt': instance.dtTxt,
    };
