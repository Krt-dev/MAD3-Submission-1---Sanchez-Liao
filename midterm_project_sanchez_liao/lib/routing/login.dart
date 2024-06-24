import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:midterm_project_sanchez_liao/router.dart';
import 'package:midterm_project_sanchez_liao/routing/homeScreen.dart';
// import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/auth";
  static const String name = "Login Screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final emailValidator = MultiValidator([
  //   RequiredValidator(errorText: 'Email is required'),
  //   EmailValidator(errorText: 'Enter a valid email address'),
  //   MaxLengthValidator(32, errorText: "Username cannot exceed 32 characters"),
  //   PatternValidator(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  //       errorText: 'Username cannot contain special characters'),
  // ]);

  // final passwordValidator = MultiValidator([
  //   RequiredValidator(errorText: 'Password is required'),
  //   MinLengthValidator(8,
  //       errorText: 'Password must be at least 8 characters long'),
  //   PatternValidator(r'(?=.*[A-Z])',
  //       errorText: 'Password must contain at least one uppercase letter'),
  //   PatternValidator(r'(?=.*?[#?!@$%^&*-])',
  //       errorText: 'Password must contain at least one special character'),
  // ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                // validator: emailValidator.call,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                // validator: passwordValidator.call,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged in',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                    );
                    GlobalRouter.I.router.go(HomeScreen.route);
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO Implement this library.