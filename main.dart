import 'dart:convert';
import 'package:usersList/api.dart';
import 'package:usersList/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Users(),
    );
  }
}

class Users extends StatefulWidget {
  @override
  createState() => _UsersState();
}

class _UsersState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading:CircleAvatar(
    backgroundImage: Image.asset('users[index].image'),
    radius: 30,
  )
              title: Text(users[index].first_name + users[index].last_name),
              subtitle:Text(users[index].email),
            );
          },
        ));
  }
}
