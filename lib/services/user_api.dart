import 'dart:convert';
import 'package:flutter_rest_api_4/model/user.dart';
import 'package:flutter_rest_api_4/model/user_dob.dart';
import 'package:flutter_rest_api_4/model/user_location.dart';
import 'package:flutter_rest_api_4/model/user_name.dart';
import 'package:flutter_rest_api_4/model/user_picture.dart';
import 'package:http/http.dart' as http;

class UserApi{
  static Future<List<User>> fetchUsers() async {


    const url = 'https://randomuser.me/api/?results=5000';
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

        final date = e['dob']['date'];
        final dob = UserDob(
          date: DateTime.parse(date), 
          age: e['dob']['age'],
          );

          final coordinates = LocationCoordinate(
            latitude: e['location']['coordinates']['latitude'], 
            longitude: e['location']['coordinates']['longitude'],
            );

          final street = LocationStreet(
                number: e['location']['street']['number'], 
                name: e['location']['street']['name'],
                );

          final location = UserLocation(
            city: e['location']['city'], 
            state: e['location']['state'], 
            country: e['location']['country'], 
            postcode: e['location']['postcode'].toString(), 
            street: street, 
            coordinates: coordinates,
            );
            
          final picture = UserPicture(
            large: e['picture']['large'],
            medium: e['picture']['medium'],
            thumbnail: e['picture']['thumbnail'],
            );
            

        return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name,
          dob: dob,
          location: location,
          picture: picture,
        );
      }).toList();

      return users;

  }
}