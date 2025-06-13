import 'package:dictionary/data/data_source/database_helper.dart';
import 'package:dictionary/data/models/word_models.dart';

class WordRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> addPalavra(String palavra) async {
    int id = await _dbHelper.insert(palavra);
    return id;
  }

  Future<int> updatePalavra(String palavra, bool status) async {
    int linhasAfetadas = await _dbHelper.update(palavra, status);
    return linhasAfetadas;
  }

  Future<void> cleanList(String columName) async {
    await _dbHelper.cleanList(columName);
    //return linhasAfetadas;
  }

  Future<List<WordModels>> getPalavrasByHistorico() async {
    final result = await _dbHelper.queryByColumn('history', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }

  Future<List<WordModels>> getPalavrasByFavorito() async {
    final result = await _dbHelper.queryByColumn('favorite', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }
}
