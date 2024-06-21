import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:midterm_project_sanchez_liao/router.dart';
import 'package:midterm_project_sanchez_liao/routing/homeScreen.dart';
//import 'package:midterm_project_sanchez_liao/routing/profile.dart';

class HomeWrapper extends StatefulWidget {
  final Widget? child;
  const HomeWrapper({super.key, this.child});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int index = 0;

  List<String> routes = [HomeScreen.route, "/prof"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? const Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;

            GlobalRouter.I.router.go(routes[i]);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Profile"),
        ],
      ),
    );
  }
}
