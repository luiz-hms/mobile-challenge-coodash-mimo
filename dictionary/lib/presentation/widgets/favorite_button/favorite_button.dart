import 'package:dictionary/core/injector.dart';
import 'package:dictionary/domain/word_repositories.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  const FavoriteButton({super.key, required this.isFavorite});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  var repository = locator.get<WordRepository>();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          widget.isFavorite
              ? Icon(Icons.favorite, color: Colors.redAccent)
              : Icon(Icons.favorite_border, color: Colors.redAccent),
      onPressed: () async {
        await repository.updatePalavra('favorite', !widget.isFavorite);
        setState(() {});
      },
    );
  }
}
