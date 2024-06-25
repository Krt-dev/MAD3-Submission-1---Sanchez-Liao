import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_project_sanchez_liao/controller/auth_controller.dart';
import 'package:midterm_project_sanchez_liao/models/box.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    //logic here
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.red,
                                  strokeWidth: 8,
                                ),
                                SizedBox(width: 10),
                                Text('Logging out...'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    //put delay here for 3seconds
                    Future.delayed(const Duration(seconds: 3), () {
                      AuthController.I.logout();
                      GlobalRouter.I.router.go(LoginScreen.route);
                      print(boxUsers.get("auth"));
                    });
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
