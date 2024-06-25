import 'package:flutter/material.dart';
import 'package:midterm_project_sanchez_liao/controller/auth_controller.dart';
import 'package:midterm_project_sanchez_liao/models/box.dart';
import 'package:midterm_project_sanchez_liao/models/user.dart';
// import 'package:go_router/go_router.dart';
import 'package:midterm_project_sanchez_liao/router.dart';
import 'package:midterm_project_sanchez_liao/routing/homeScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address'),
    MaxLengthValidator(32, errorText: "Username cannot exceed 32 characters"),
    PatternValidator(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        errorText: 'Username cannot contain special characters'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8,
        errorText: 'Password must be at least 8 characters long'),
    PatternValidator(r'(?=.*[A-Z])',
        errorText: 'Password must contain at least one uppercase letter'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Password must contain at least one special character'),
  ]);

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
                validator: emailValidator.call,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: passwordValidator.call,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      //progress indicator para ig log in while ga check pa sa api login if sakto or naay exception
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
                                    color: Colors.blue,
                                    strokeWidth: 8,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Logging in...'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      //logging in sa usuer
                      await AuthController.I.login(
                        _usernameController.text.trim(),
                        _passwordController.text.trim(),
                      );
                      //adding user sa hive box
                      boxUsers.add(User(
                          username: _usernameController.text.trim(),
                          password: _passwordController.text.trim()));
                      boxUsers.put("auth", 1);
                      print(boxUsers.get("auth"));
                      print(boxUsers.getAt(0));

                      Navigator.pop(
                          context); // Close the dialog after successful login

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logged in',
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } catch (e) {
                      Navigator.pop(
                          context); // Close the dialog in case of error

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
