import 'package:dictionary/data/models/word_models.dart';
import 'package:dictionary/domain/word_repositories.dart';
import 'package:dictionary/presentation/screens/word_detail/word_detail.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final WordRepository _palavraRepository = WordRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lista de históricos')),
      body: FutureBuilder<List<WordModels>>(
        future: _palavraRepository.getPalavrasByHistorico(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar histórico"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhuma palavra no histórico"));
          }

          final palavras = snapshot.data!;
          return GridView.builder(
            itemCount: palavras.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              //final palavra = palavras[index];
              //bool isSalva = _isPalavraSalva(palavra);

              return Card(
                child: ListTile(
                  title: Text(palavras[index].word),
                  trailing: IconButton(
                    icon: Icon(
                      palavras[index].favorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    onPressed:
                        () => {
                          {
                            _palavraRepository.updatePalavra(
                              'favorite',
                              !palavras[index].favorite,
                            ),
                          },
                        },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            //((context) => WordDetail(palavras[index].word)),
                            ((context) => WordDetail()),
                      ),
                    );
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
