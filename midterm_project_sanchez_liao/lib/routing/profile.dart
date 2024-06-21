import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placeholder"),
      ),
      body: const Center(
        child: Text("Placeholder"),
      ),
    );
  }
}
