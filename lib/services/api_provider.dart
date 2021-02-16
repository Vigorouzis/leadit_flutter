import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leadit_flutter/models/post.dart';

class ApiProvider {
  static String apiKey = 'HnZlqBMsYDG3Gt0XYNlO1IIAMAWk01xC';
  final String baseApi =
      'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=$apiKey';

  Future<List<Post>> getPosts() async {
    final response = await http.get(baseApi, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(utf8convert(response.body));
      List<dynamic> data = map["results"];
      var result = data.map((json) => Post.fromJson(json)).toList();
      return result;
    } else {
      throw Exception('Error fetching posts');
    }
  }

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
}
