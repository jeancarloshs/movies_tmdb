// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_tmdb/helpers/store/details_store.dart';
import 'package:movies_tmdb/http/http_client.dart';
import 'package:movies_tmdb/pages/details_page.dart';
import 'package:movies_tmdb/repositories/details_repository.dart';

void main() {
  testWidgets('details repository ...', (tester) async {
    final DetailsStore detailsStore = DetailsStore(
      repository: DetailsRepository(
        client: HttpClient(),
        videoKey: videoKeyYoutube,
      ),
    );
    print('teste: ${detailsStore.detailsState.value}');
  });
}
