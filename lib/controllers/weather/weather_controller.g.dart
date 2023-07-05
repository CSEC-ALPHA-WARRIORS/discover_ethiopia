// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentWeatherHash() => r'c5b1a3c74a6f9e480c5fe7ce1f3ff871e0b09838';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef CurrentWeatherRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;

/// See also [currentWeather].
@ProviderFor(currentWeather)
const currentWeatherProvider = CurrentWeatherFamily();

/// See also [currentWeather].
class CurrentWeatherFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [currentWeather].
  const CurrentWeatherFamily();

  /// See also [currentWeather].
  CurrentWeatherProvider call({
    required double lat,
    required double lon,
  }) {
    return CurrentWeatherProvider(
      lat: lat,
      lon: lon,
    );
  }

  @override
  CurrentWeatherProvider getProviderOverride(
    covariant CurrentWeatherProvider provider,
  ) {
    return call(
      lat: provider.lat,
      lon: provider.lon,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentWeatherProvider';
}

/// See also [currentWeather].
class CurrentWeatherProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [currentWeather].
  CurrentWeatherProvider({
    required this.lat,
    required this.lon,
  }) : super.internal(
          (ref) => currentWeather(
            ref,
            lat: lat,
            lon: lon,
          ),
          from: currentWeatherProvider,
          name: r'currentWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentWeatherHash,
          dependencies: CurrentWeatherFamily._dependencies,
          allTransitiveDependencies:
              CurrentWeatherFamily._allTransitiveDependencies,
        );

  final double lat;
  final double lon;

  @override
  bool operator ==(Object other) {
    return other is CurrentWeatherProvider &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, lon.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$forecastByNameHash() => r'4919a7c089bf09c1f3408dbda7f52e8af2fd61fc';
typedef ForecastByNameRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;

/// See also [forecastByName].
@ProviderFor(forecastByName)
const forecastByNameProvider = ForecastByNameFamily();

/// See also [forecastByName].
class ForecastByNameFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [forecastByName].
  const ForecastByNameFamily();

  /// See also [forecastByName].
  ForecastByNameProvider call({
    required String name,
  }) {
    return ForecastByNameProvider(
      name: name,
    );
  }

  @override
  ForecastByNameProvider getProviderOverride(
    covariant ForecastByNameProvider provider,
  ) {
    return call(
      name: provider.name,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forecastByNameProvider';
}

/// See also [forecastByName].
class ForecastByNameProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [forecastByName].
  ForecastByNameProvider({
    required this.name,
  }) : super.internal(
          (ref) => forecastByName(
            ref,
            name: name,
          ),
          from: forecastByNameProvider,
          name: r'forecastByNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forecastByNameHash,
          dependencies: ForecastByNameFamily._dependencies,
          allTransitiveDependencies:
              ForecastByNameFamily._allTransitiveDependencies,
        );

  final String name;

  @override
  bool operator ==(Object other) {
    return other is ForecastByNameProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$forecastByPositionHash() =>
    r'5e47b709cc61f1f8c73dc69aa8a8440ba22281b3';
typedef ForecastByPositionRef
    = AutoDisposeFutureProviderRef<Map<dynamic, dynamic>?>;

/// See also [forecastByPosition].
@ProviderFor(forecastByPosition)
const forecastByPositionProvider = ForecastByPositionFamily();

/// See also [forecastByPosition].
class ForecastByPositionFamily
    extends Family<AsyncValue<Map<dynamic, dynamic>?>> {
  /// See also [forecastByPosition].
  const ForecastByPositionFamily();

  /// See also [forecastByPosition].
  ForecastByPositionProvider call({
    required double lat,
    required double lon,
  }) {
    return ForecastByPositionProvider(
      lat: lat,
      lon: lon,
    );
  }

  @override
  ForecastByPositionProvider getProviderOverride(
    covariant ForecastByPositionProvider provider,
  ) {
    return call(
      lat: provider.lat,
      lon: provider.lon,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forecastByPositionProvider';
}

/// See also [forecastByPosition].
class ForecastByPositionProvider
    extends AutoDisposeFutureProvider<Map<dynamic, dynamic>?> {
  /// See also [forecastByPosition].
  ForecastByPositionProvider({
    required this.lat,
    required this.lon,
  }) : super.internal(
          (ref) => forecastByPosition(
            ref,
            lat: lat,
            lon: lon,
          ),
          from: forecastByPositionProvider,
          name: r'forecastByPositionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forecastByPositionHash,
          dependencies: ForecastByPositionFamily._dependencies,
          allTransitiveDependencies:
              ForecastByPositionFamily._allTransitiveDependencies,
        );

  final double lat;
  final double lon;

  @override
  bool operator ==(Object other) {
    return other is ForecastByPositionProvider &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, lon.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
