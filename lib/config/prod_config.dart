import 'package:movies_tmdb/config/base_config.dart';

class ProdConfig extends BaseConfig {
  @override
  String get apiHost => "https://api.themoviedb.org/3/";

  @override
  String get host => "https://www.themoviedb.org/";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => true;

  @override
  bool get useHttps => true;
}
