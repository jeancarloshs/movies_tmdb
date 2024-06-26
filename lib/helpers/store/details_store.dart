import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_tmdb/helpers/exceptions/exceptions.dart';
import 'package:movies_tmdb/models/details_model.dart';
import 'package:movies_tmdb/pages/details_page.dart';
import 'package:movies_tmdb/repository/i_details_repository.dart';

class DetailsStore {
  final IDetailsRepository repository;

  DetailsStore({required this.repository});

  // Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para state
  // final ValueNotifier<List<DetailsModel>> detailsState = ValueNotifier([]);
  final RxList<DetailsModel> detailsState = RxList<DetailsModel>();

  // Variavel reativa para erro
  final ValueNotifier<String> error = ValueNotifier('');

  Future getDetails(int videoKeyYoutube) async {
    isLoading.value = true;
    try {
      final List<DetailsModel> result = await repository.getDetails(videoKeyYoutube);
      detailsState.value = result;
    } on ExceptionNotFound catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
