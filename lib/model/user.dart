// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_rest_api_4/model/user_dob.dart';
import 'package:flutter_rest_api_4/model/user_location.dart';
import 'package:flutter_rest_api_4/model/user_name.dart';
import 'package:flutter_rest_api_4/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

