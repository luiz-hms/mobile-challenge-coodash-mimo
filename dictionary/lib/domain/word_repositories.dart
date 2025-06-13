import 'package:dictionary/data/data_source/database_helper.dart';
import 'package:dictionary/data/models/word_models.dart';

class WordRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> insertWord(String palavra) async {
    int id = await _dbHelper.insert(palavra);
    return id;
  }

  Future<int> updateWord(String word, bool status) async {
    int linhasAfetadas = await _dbHelper.update(word, status);
    return linhasAfetadas;
  }

  Future<void> cleanList(String columName) async {
    await _dbHelper.cleanList(columName);
  }

  Future<List<WordModels>> getWordsByHistory() async {
    final result = await _dbHelper.queryByColumn('history', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }

  Future<List<WordModels>> getWordsByFavorite() async {
    final result = await _dbHelper.queryByColumn('favorite', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }
}
