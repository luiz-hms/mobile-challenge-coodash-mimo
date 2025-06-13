import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  static const String dbName = 'wordsDb.db';
  static const String tableName = 'tblWords';

  static const String columnId = 'id';
  static const String columnWord = 'word';
  static const String columnFavorite = 'favorite';
  static const String columnHistory = 'history';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnWord TEXT,
        $columnFavorite INTEGER DEFAULT 0,
        $columnHistory INTEGER DEFAULT 1
      );
    ''');
  }

  Future<int> insert(String word) async {
    final db = await database;
    return await db.insert(tableName, {
      columnWord: word,
      columnFavorite: 0,
      columnHistory: 1,
    });
  }

  Future<void> cleanList(String columnName) async {
    try {
      final db = await database;
      await db.update(tableName, {'favorite': 0});
    } catch (e) {
      throw Exception('Erro ao limpar a lista');
    }
  }

  Future<int> update(String word, bool status) async {
    final db = await database;
    return await db.update(
      tableName,
      {'favorite': status ? 1 : 0},
      where: '$columnWord = ?',
      whereArgs: [word],
    );
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryByColumn(
    String column,
    int value,
  ) async {
    final db = await database;
    return await db.query(tableName, where: '$column = ?', whereArgs: [value]);
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
