// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movies_tmdb/helpers/store/details_store.dart';
import 'package:movies_tmdb/http/http_client.dart';
import 'package:movies_tmdb/models/now_playing_model.dart';
import 'package:intl/intl.dart';
import 'package:movies_tmdb/repositories/details_repository.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.itemDetail, super.key});

  final NowPlayingModel itemDetail;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

 int videoKeyYoutube = 0;

class _DetailsPageState extends State<DetailsPage> {
  final DetailsStore detailsStore = DetailsStore(
    repository: DetailsRepository(
      client: HttpClient(),
      videoKey: videoKeyYoutube,
    ),
  );

  @override
  void initState() {
    super.initState();
    detailsStore.getDetails();
  }

  @override
  Widget build(BuildContext context) {
    String dateApi = widget.itemDetail.releaseDate;
    DateTime date = DateTime.parse(dateApi);
    String formattedDate = DateFormat("dd/MM/yyy").format(date);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhes do Filme",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://image.tmdb.org/t/p/original/${widget.itemDetail.posterPath}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.itemDetail.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.itemDetail.overview,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Ano de Lançamento - $formattedDate",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.zero,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      videoKeyYoutube = widget.itemDetail.id;
                      print(videoKeyYoutube);
                      print(detailsStore.detailsState.value);
                    },
                    child: const Text(
                      "Assistir",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
