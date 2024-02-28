
import 'package:movies_tmdb/models/now_playing_model.dart';

abstract class INowPlayingRepository {
  Future<List<NowPlayingModel>> fetchNowPlaying();
}