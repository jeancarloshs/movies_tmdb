import 'package:flutter/material.dart';
import 'package:movies_tmdb/helpers/store/now_playing_store.dart';
import 'package:movies_tmdb/http/http_client.dart';
import 'package:movies_tmdb/pages/details_page.dart';
import 'package:movies_tmdb/repositories/now_playing_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NowPlayingStore nowPlayingStore = NowPlayingStore(
    repository: NowPlayingRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    nowPlayingStore.getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Filmes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          nowPlayingStore.isLoading,
          nowPlayingStore.nowPlayingState,
          nowPlayingStore.error,
        ]),
        builder: (context, child) {
          if (nowPlayingStore.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (nowPlayingStore.error.value.isNotEmpty) {
            return Center(
              child: Text(
                nowPlayingStore.error.value,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            );
          }

          if (nowPlayingStore.nowPlayingState.value.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum filme encontrado",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: nowPlayingStore.nowPlayingState.value.length,
              itemBuilder: (_, index) {
                final item = nowPlayingStore.nowPlayingState.value[index];
                return SizedBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original/${item.posterPath}",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: SizedBox(
                          child: Text(
                            item.overview,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
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
                              backgroundColor: Colors.grey[200],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          itemDetail: item,
                                        )),
                              ).then((value) {
                                setState(() {
                                  print('Atualizando a lista');
                                  nowPlayingStore.getNowPlaying();
                                });
                              });
                              print('Detalhes do filme: ${item.title}');
                            },
                            child: const Text(
                              "Detalhes",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
