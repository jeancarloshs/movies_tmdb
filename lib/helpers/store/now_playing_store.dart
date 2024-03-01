import 'package:flutter/material.dart';
import 'package:movies_tmdb/helpers/exceptions/exceptions.dart';
import 'package:movies_tmdb/models/now_playing_model.dart';
import 'package:movies_tmdb/repository/i_now_playing_repository.dart';

class NowPlayingStore {
  final INowPlayingRepository repository;

  NowPlayingStore({
    required this.repository,
  });

  // Variável reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<NowPlayingModel>> nowPlayingState =
      ValueNotifier<List<NowPlayingModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getNowPlaying() async {
    isLoading.value = true;
    try {
      final List<NowPlayingModel> result = await repository.fetchNowPlaying();
      nowPlayingState.value = result;
    } on ExceptionNotFound catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
