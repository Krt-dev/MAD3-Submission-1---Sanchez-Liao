import 'package:flutter/material.dart';
import 'package:midterm_project_sanchez_liao/models/box.dart';
import 'package:midterm_project_sanchez_liao/models/user.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  static const String name = "Home Screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = boxUsers.getAt(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Text(
          "Welcome ${user.username}",
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
