import 'package:dictionary/data/models/api_dictionary_models.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  Future<List<ApiDictionaryModels>> fetchWordDetails(String word) async {
    try {
      final response = await _dio.get('$_baseUrl$word');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => ApiDictionaryModels.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load word details');
      }
    } catch (e) {
      throw Exception('Error fetching word details: $e');
    }
  }
}
