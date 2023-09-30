import 'package:flutter/material.dart';
import 'package:flutter_rest_api_4/model/user.dart';
import 'package:flutter_rest_api_4/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  bool isLoading = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await UserApi.fetchUsers();
      setState(() {
        users = response;
        isLoading = false;
        error = '';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = 'Failed to fetch users';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Rest API 4"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (error.isNotEmpty) {
      return Center(child: Text(error));
    } else {
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.picture.thumbnail),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
              trailing: Text(user.nat),
            ),
          );
        },
      );
    }
  }
}
