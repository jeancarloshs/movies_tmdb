import 'package:movies_tmdb/config/prod_config.dart';
import 'package:http/http.dart' as http;

class NowPlaying {
  final prodConfig = ProdConfig();

  Future nowPlayingServices() async {
    http.Response response = await http.get(Uri.parse(prodConfig.apiHost));
    return response;
  }
}