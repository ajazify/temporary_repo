import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_clone/features/todo/response_model.dart';

class TodoApi {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
  Future<List<TodoResponseApi>> callApi() async {
    try {
      var response = await http.get(url);
      List<dynamic> finalResponse = jsonDecode(response.body);
      List<TodoResponseApi> todoResponse = finalResponse.map((e) => TodoResponseApi.fromJson(e)).toList();
      return todoResponse;
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
