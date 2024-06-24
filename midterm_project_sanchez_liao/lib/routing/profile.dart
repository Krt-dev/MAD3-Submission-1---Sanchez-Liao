import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_project_sanchez_liao/router.dart';
import 'package:midterm_project_sanchez_liao/routing/login.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = "/prof";
  static const String name = "Profile Screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Screen')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              //logic here
              GlobalRouter.I.router.go(LoginScreen.route);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // Text color
              shadowColor: Colors.black, // Shadow color
              elevation: 5, // Elevation
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8), // Padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
            child: const Text('Log out'),
          ),
        ),
      ),
    );
  }
}
