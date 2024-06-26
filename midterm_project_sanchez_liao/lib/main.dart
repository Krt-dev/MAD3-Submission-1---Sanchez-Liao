import 'package:flutter/material.dart';
import 'package:midterm_project_sanchez_liao/controller/auth_controller.dart';
import 'package:midterm_project_sanchez_liao/models/box.dart';
import 'package:midterm_project_sanchez_liao/models/user.dart';
import 'package:midterm_project_sanchez_liao/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  AuthController.initialize();
  GlobalRouter.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  boxUsers = await Hive.openBox("userBox");
  //await AuthController.I.loadSession();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GlobalRouter.I.router,
      title: 'Login Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
