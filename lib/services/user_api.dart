import 'dart:convert';
import 'package:flutter_rest_api_4/model/user.dart';
import 'package:flutter_rest_api_4/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi{
  static Future<List<User>> fetchUsers() async {


    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    
    final users = results.map((e) {

      final name = UserName(
        first: e['name']['first'], 
        title: e['name']['title'], 
        last: e['name']['last']);

        return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name,
        );
      }).toList();

      return users;

  }
}