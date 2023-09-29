import 'package:flutter/material.dart';
import 'package:flutter_rest_api_4/model/user.dart';
import 'package:flutter_rest_api_4/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Rest API 4"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (content, index){
          final user = users[index];

          return ListTile(
            leading: Text(user.fullName),
            trailing: Text(user.nat),
            title: Text(user.phone),
            subtitle: Text(user.email),
          );
        }
        ),
    );
  }
  
  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  
}