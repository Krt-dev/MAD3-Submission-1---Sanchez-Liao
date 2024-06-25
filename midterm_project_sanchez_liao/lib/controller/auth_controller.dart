import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:midterm_project_sanchez_liao/enum/enum.dart';
import 'package:midterm_project_sanchez_liao/models/box.dart';
import 'package:midterm_project_sanchez_liao/models/user.dart';

class AuthController with ChangeNotifier {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;
  SimulatedAPI api = SimulatedAPI();

  Future<void> login(String username, String password) async {
    try {
      bool isLoggedIn = await api.login(username, password);
      if (isLoggedIn) {
        state = AuthState.authenticated;
        print(state);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  void logout() {
    if (boxUsers.isNotEmpty) {
      boxUsers.deleteAt(0);
      boxUsers.put("auth", 0);
      state = AuthState.unauthenticated;
      notifyListeners();
    }
  }

  Future<void> loadSession() async {
    if (boxUsers.getAt(0) != null && boxUsers.get("auth") == 1) {
      User user = boxUsers.getAt(0);
      login(user.username, user.password);
    }
  }
}

//mockup

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678ABCabc"};

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    if (users[username] == null) {
      throw Exception("User does not exist");
    }
    if (users[username] != password) {
      throw Exception("Password does not match");
    }
    return users[username] == password;
  }
}
