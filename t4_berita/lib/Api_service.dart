import 'dart:convert';

import 'package:http/http.dart' as http;

import 'article_model.dart';

class ApiService {
  static const _urlBase =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=03c27af7ad3b4368b212dbc47927b281';

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(_urlBase));

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat Artikel');
    }
    final data = jsonDecode(response.body);
    return (data['articles'] as List)
        .map((json) => Article.fromJson(json))
        .toList();
  }
}
