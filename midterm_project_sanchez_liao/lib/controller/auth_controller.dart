import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:midterm_project_sanchez_liao/enum/enum.dart';

class AuthController with ChangeNotifier {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;
  SimulatedAPI api = SimulatedAPI();

  login(String username, String password) async {
    bool isLoggedIn = await api.login(username, password);

    if (isLoggedIn) {
      state = AuthState.authenticated;
      notifyListeners();
    }
  }
}

//mockup

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678ABCabc"};

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 4));
    if (users[username] == null) {
      throw Exception("User does not exist");
    }
    return users[username] == password;
  }
}
