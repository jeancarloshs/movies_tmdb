import 'package:movies_tmdb/config/base_config.dart';

class ProdConfig extends BaseConfig {
  @override
  String get apiHost => const String.fromEnvironment("API_URL");

  @override
  String get host => const String.fromEnvironment("BASE_URL");

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => true;

  @override
  bool get useHttps => true;
}
