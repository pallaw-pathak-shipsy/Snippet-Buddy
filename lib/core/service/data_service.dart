import 'dart:convert';

import 'package:blog_minimal/model/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DataService {
  List<Category> getAllCategory() {
    final data = _parseJsonFromAssets("assets/json/snippet_data.json");

    return [];
  }

  Future<List<Post>> getAllSnippet() async {
    final data = await _parseJsonFromAssets("assets/json/snippet_data.json");

    final snippetList =
        (data["data"] as List).map((e) => Post.fromJson(e)).toList();

    return snippetList;
  }

  Future<Map<String, dynamic>> _parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');

    await Future.delayed(Duration(seconds: 1));
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
