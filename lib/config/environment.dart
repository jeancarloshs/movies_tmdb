import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';
import 'staging_config.dart';

class Environment {
  static Environment? _singleton;

  factory Environment() {
    _singleton ??= Environment._createInstance();

    return _singleton!;
  }

  Environment._createInstance();

  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
