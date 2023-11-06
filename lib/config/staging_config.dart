import 'base_config.dart';

class StagingConfig implements BaseConfig {
  @override
  String get apiHost => "staging.example.com";

  @override
  String get host => "staging.example.com";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => true;
}
