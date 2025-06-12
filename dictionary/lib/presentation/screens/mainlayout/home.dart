import 'dart:convert';

import 'package:dictionary/data/models/word_models.dart';
import 'package:dictionary/domain/word_repositories.dart';
import 'package:dictionary/presentation/screens/word_detail/word_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WordRepository _repository = WordRepository();
  List<String> palavras = []; // Lista de palavras extraídas do arquivo JSON
  List<WordModels> palavrasSalvas = [];

  @override
  void initState() {
    super.initState();
    _loadPalavrasFromJson(); // Carregar palavras do arquivo JSON
  }

  // Função para carregar palavras do arquivo JSON local
  Future<void> _loadPalavrasFromJson() async {
    // Carregar o arquivo JSON do assets com a lista de palavras
    final String response = await rootBundle.loadString(
      'assets/words_dictionary.json',
    );
    final data = json.decode(response); // Decodificar o JSON
    setState(() {
      palavras = List<String>.from(data['wordsJson']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body:
          palavras.isEmpty
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Exibe um carregamento enquanto carrega o JSON
              : Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  itemCount: palavras.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    String palavra = palavras[index];

                    return Card(
                      child: ListTile(
                        title: Text(palavra),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          onPressed:
                              () => {
                                _repository.updatePalavra('favorite', true),
                              },
                        ),
                        onTap: () async {
                          int id = await _repository.addPalavra(palavra);
                          if (id != 0) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => WordDetail()),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
