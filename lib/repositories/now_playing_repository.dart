import 'dart:convert';

import 'package:movies_tmdb/helpers/interfaces/i_http_client_interface.dart';
import 'package:movies_tmdb/models/now_playing_model.dart';
import 'package:http/http.dart' as http;
import 'package:movies_tmdb/repository/i_now_playing_repository.dart';

class NowPlayingRepository implements INowPlayingRepository {
  // final INowPlayingRepository iNowPlayingRepository = NowPlayingRepository();

  final IHttpClient client;
  final cliente = http.Client();

  NowPlayingRepository({
    required this.client,
  });

  @override
  Future<List<NowPlayingModel>> fetchNowPlaying() async {
    final response = await cliente.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=35d85489e2e98217e6bb80e10bd639e3&language=pt-BR'));

    // if (response.statusCode == 200) {
      final List<NowPlayingModel> getAllMovies = [];
      final body = jsonDecode(response.body);
      body['results'].forEach((item) {
        final NowPlayingModel playingNow = NowPlayingModel.fromJson(item);
        getAllMovies.add(playingNow);
      }).toList();
      // body.map((item) {
      //   final NowPlayingModel playingNow = NowPlayingModel.fromJson(item);
      //   getAllMovies.add(playingNow);
      // }).toList();
      
      return getAllMovies;
    // } else if (response.statusCode == 404) {
    //   throw ExceptionNotFound(message: 'A url informada não foi encontrada!');
    // } else {
    //   throw Exception('Não foi possivel carregar os filmes!');
    // }
  }
}
