import 'package:dictionary/core/injector.dart';
import 'package:dictionary/data/models/word_models.dart';
import 'package:dictionary/domain/word_repositories.dart';
import 'package:dictionary/presentation/screens/word_detail/word_detail.dart';
import 'package:dictionary/presentation/widgets/card/card.dart';
import 'package:dictionary/presentation/widgets/favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var repository = locator.get<WordRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lista de favoritos')),
      body: FutureBuilder<List<WordModels>>(
        future: repository.getPalavrasByFavorito(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar Favoritos"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhuma palavra nos Favoritos"));
          }

          final listwords = snapshot.data!;
          return GridView.builder(
            itemCount: listwords.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final words = listwords[index];
              return CustomCard(
                word: words.word,
                trailing: FavoriteButton(isFavorite: words.favorite),
              );
            },
          );
        },
      ),
    );
  }
}
