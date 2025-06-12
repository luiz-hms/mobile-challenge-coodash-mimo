import 'package:dictionary/data/data_source/database_helper.dart';
import 'package:dictionary/data/models/word_models.dart';

class WordRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Adicionar palavra ao banco de dados
  Future<int> addPalavra(String palavra) async {
    int id = await _dbHelper.insert(palavra);
    return id;
  }

  // Atualizar status de favorito
  Future<int> updatePalavra(String palavra, bool status) async {
    int linhasAfetadas = await _dbHelper.update(palavra, status);
    return linhasAfetadas;
  }

  /*
  Future<int> updatePalavra(String row, bool status) async {
    int linhasAfetadas = await _dbHelper.update(row, status);
    print(linhasAfetadas.toString());
    return linhasAfetadas;
  }
*/
  // Buscar todas as palavras salvas no banco
  Future<List<WordModels>> getPalavrasByHistorico() async {
    final result = await _dbHelper.queryByColumn('history', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }

  // Buscar palavras favoritas no banco
  Future<List<WordModels>> getPalavrasByFavorito() async {
    final result = await _dbHelper.queryByColumn('favorite', 1);
    return result.map((map) => WordModels.fromMap(map)).toList();
  }
}
