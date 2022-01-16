import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covinet/News/model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/everything?q=covid&apiKey=b5192746245f4d3e83ad09d377381640");

  final response = await http.get(uri);
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];
    print(map);
    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    print(_articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}
