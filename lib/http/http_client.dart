import 'package:http/http.dart' as http;
import 'package:movies_tmdb/helpers/interfaces/i_http_client_interface.dart';

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<String> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return response.body;
  }
}
