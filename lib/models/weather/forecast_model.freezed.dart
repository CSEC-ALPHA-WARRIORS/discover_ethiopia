// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return _ForecastModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastModel {
  int get dt => throw _privateConstructorUsedError;
  ForecastMain get main => throw _privateConstructorUsedError;
  List<Forecast> get weather => throw _privateConstructorUsedError;
  ForecastClouds get clouds => throw _privateConstructorUsedError;
  ForecastWind get wind => throw _privateConstructorUsedError;
  int get visibility => throw _privateConstructorUsedError;
  double get pop => throw _privateConstructorUsedError;
  ForecastRain get rain => throw _privateConstructorUsedError;
  ForecastSys get sys => throw _privateConstructorUsedError;
  String get dtTxt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastModelCopyWith<ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelCopyWith<$Res> {
  factory $ForecastModelCopyWith(
          ForecastModel value, $Res Function(ForecastModel) then) =
      _$ForecastModelCopyWithImpl<$Res, ForecastModel>;
  @useResult
  $Res call(
      {int dt,
      ForecastMain main,
      List<Forecast> weather,
      ForecastClouds clouds,
      ForecastWind wind,
      int visibility,
      double pop,
      ForecastRain rain,
      ForecastSys sys,
      String dtTxt});
}

/// @nodoc
class _$ForecastModelCopyWithImpl<$Res, $Val extends ForecastModel>
    implements $ForecastModelCopyWith<$Res> {
  _$ForecastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? clouds = null,
    Object? wind = null,
    Object? visibility = null,
    Object? pop = null,
    Object? rain = null,
    Object? sys = null,
    Object? dtTxt = null,
  }) {
    return _then(_value.copyWith(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as ForecastMain,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
      clouds: null == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as ForecastClouds,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as ForecastWind,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as ForecastRain,
      sys: null == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as ForecastSys,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForecastModelCopyWith<$Res>
    implements $ForecastModelCopyWith<$Res> {
  factory _$$_ForecastModelCopyWith(
          _$_ForecastModel value, $Res Function(_$_ForecastModel) then) =
      __$$_ForecastModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dt,
      ForecastMain main,
      List<Forecast> weather,
      ForecastClouds clouds,
      ForecastWind wind,
      int visibility,
      double pop,
      ForecastRain rain,
      ForecastSys sys,
      String dtTxt});
}

/// @nodoc
class __$$_ForecastModelCopyWithImpl<$Res>
    extends _$ForecastModelCopyWithImpl<$Res, _$_ForecastModel>
    implements _$$_ForecastModelCopyWith<$Res> {
  __$$_ForecastModelCopyWithImpl(
      _$_ForecastModel _value, $Res Function(_$_ForecastModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? clouds = null,
    Object? wind = null,
    Object? visibility = null,
    Object? pop = null,
    Object? rain = null,
    Object? sys = null,
    Object? dtTxt = null,
  }) {
    return _then(_$_ForecastModel(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as ForecastMain,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
      clouds: null == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as ForecastClouds,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as ForecastWind,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as ForecastRain,
      sys: null == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as ForecastSys,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForecastModel implements _ForecastModel {
  const _$_ForecastModel(
      {required this.dt,
      required this.main,
      required final List<Forecast> weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.rain,
      required this.sys,
      required this.dtTxt})
      : _weather = weather;

  factory _$_ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastModelFromJson(json);

  @override
  final int dt;
  @override
  final ForecastMain main;
  final List<Forecast> _weather;
  @override
  List<Forecast> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final ForecastClouds clouds;
  @override
  final ForecastWind wind;
  @override
  final int visibility;
  @override
  final double pop;
  @override
  final ForecastRain rain;
  @override
  final ForecastSys sys;
  @override
  final String dtTxt;

  @override
  String toString() {
    return 'ForecastModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, rain: $rain, sys: $sys, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastModel &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.clouds, clouds) || other.clouds == clouds) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.pop, pop) || other.pop == pop) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.sys, sys) || other.sys == sys) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dt,
      main,
      const DeepCollectionEquality().hash(_weather),
      clouds,
      wind,
      visibility,
      pop,
      rain,
      sys,
      dtTxt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForecastModelCopyWith<_$_ForecastModel> get copyWith =>
      __$$_ForecastModelCopyWithImpl<_$_ForecastModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForecastModelToJson(
      this,
    );
  }
}

abstract class _ForecastModel implements ForecastModel {
  const factory _ForecastModel(
      {required final int dt,
      required final ForecastMain main,
      required final List<Forecast> weather,
      required final ForecastClouds clouds,
      required final ForecastWind wind,
      required final int visibility,
      required final double pop,
      required final ForecastRain rain,
      required final ForecastSys sys,
      required final String dtTxt}) = _$_ForecastModel;

  factory _ForecastModel.fromJson(Map<String, dynamic> json) =
      _$_ForecastModel.fromJson;

  @override
  int get dt;
  @override
  ForecastMain get main;
  @override
  List<Forecast> get weather;
  @override
  ForecastClouds get clouds;
  @override
  ForecastWind get wind;
  @override
  int get visibility;
  @override
  double get pop;
  @override
  ForecastRain get rain;
  @override
  ForecastSys get sys;
  @override
  String get dtTxt;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastModelCopyWith<_$_ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}
