import 'package:movies_tmdb/helpers/exceptions/exceptions.dart';
import 'package:movies_tmdb/http/http_client.dart';
import 'package:movies_tmdb/models/details_model.dart';
import 'package:movies_tmdb/repository/i_details_repository.dart';

class DetailsRepository implements IDetailsRepository {
  final IHttpClient client;
  final int videoKey;

  DetailsRepository({
    required this.client,
    required this.videoKey,
  });

  @override
  Future<List<DetailsModel>> getDetails() async {
    final response = await client.get(
        url:
            'https://api.themoviedb.org/3/movie/693134?api_key=35d85489e2e98217e6bb80e10bd639e3&language=pt-BR&append_to_response=videos');

    if (response.statusCode == 200) {
      final List<DetailsModel> getDetails = [];
      final body = response.body;

      body['results'].map((item) {
        final DetailsModel detail = DetailsModel.fromMap(item);
        getDetails.add(detail);
      }).toList();

      return getDetails;
    } else if (response.statusCode == 404) {
      throw ExceptionNotFound(message: 'A url informada não foi encontrada!');
    } else {
      throw Exception('Não foi possivel carregar os filmes!');
    }
  }
}
