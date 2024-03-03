// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_tmdb/helpers/store/now_playing_store.dart';
import 'package:movies_tmdb/http/http_client.dart';
import 'package:movies_tmdb/repositories/now_playing_repository.dart';

void main() {
  testWidgets('now playing repository ...', (tester) async {
    final NowPlayingStore nowPlayingStore = NowPlayingStore(
      repository: NowPlayingRepository(
        client: HttpClient(),
      ),
    );
    print('teste: ${nowPlayingStore.nowPlayingState.value}');
  });
}
