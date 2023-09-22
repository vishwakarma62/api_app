import 'dart:convert';
import 'package:api_app/model/model.dart';
import 'package:http/http.dart' as http;

class MyRepository {
  var baseUrl = 'https://reqres.in/api/users'; // Replace with your API endpoint

  Future<List<UserModel>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl)); // Use the correct URL

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      print(data
          .map((e) => UserModel.fromJson(e))
          .toList()); // Extract 'data' from the JSON response

      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
