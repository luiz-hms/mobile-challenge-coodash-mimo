import 'package:dictionary/data/models/word_models.dart';
import 'package:dictionary/domain/word_repositories.dart';
import 'package:dictionary/presentation/screens/word_detail/word_detail.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final WordRepository _wordRepository = WordRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lista de favoritos')),
      body: FutureBuilder<List<WordModels>>(
        future: _wordRepository.getPalavrasByFavorito(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar Favoritos"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhuma palavra nos Favoritos"));
          }

          final palavras = snapshot.data!;
          return GridView.builder(
            itemCount: palavras.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              String palavra = palavras[index].word;
              return Card(
                child: ListTile(
                  title: Text(palavras[index].word),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.redAccent),
                    onPressed:
                        () => {
                          {
                            _wordRepository.updatePalavra(
                              'favorite',
                              !palavras[index].favorite,
                            ),
                          },
                        },
                  ),
                  onTap: () async {
                    int id = await _wordRepository.addPalavra(palavra);
                    if (id != 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //builder: ((context) => WordDetail(palavra)),
                          builder: ((context) => WordDetail()),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
