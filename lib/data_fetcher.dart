import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<String> titles = data.map((item) => item['title']).cast<String>().toList();
    return titles;
  } else {
    throw Exception('Failed to load data');
  }
}