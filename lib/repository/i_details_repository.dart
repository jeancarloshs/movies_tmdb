import 'package:movies_tmdb/models/details_model.dart';

abstract class IDetailsRepository {
  Future<List<DetailsModel>> getDetails();
}