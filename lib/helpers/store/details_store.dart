import 'package:flutter/material.dart';
import 'package:movies_tmdb/helpers/exceptions/exceptions.dart';
import 'package:movies_tmdb/models/details_model.dart';
import 'package:movies_tmdb/repositories/details_repository.dart';

class DetailsStore {
  final IDetailsRepository repository;

  DetailsStore({required this.repository});

  // Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variavel reativa para state
  final ValueNotifier<List<DetailsModel>> detailsState = ValueNotifier([]);

  // Variavel reativa para erro
  final ValueNotifier<String> error = ValueNotifier('');

  Future getDetails() async {
    isLoading.value = true;
    try {
      final List<DetailsModel> result = await repository.getDetails();
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
