import 'package:flutter/material.dart';
import 'package:uoni_test/pages/landing_page.dart';
import 'package:uoni_test/services/api_services.dart';

/// A StatefulWidget representing the login page.
///
/// This page provides a user interface for entering a username and password
/// to perform a login operation. It utilizes the [ApiServices] class to
/// authenticate the user and handles the navigation based on the login result.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passWordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Initiates the login process when the "LOGIN" button is pressed.
                  ApiServices.logUserIn(
                    userName: userNameController.text.trim(),
                    passWord: passWordController.text.trim(),
                  ).then(
                    (value) {
                      if (value.successful == false) {
                        // Displays an error message as a snack bar if login fails.
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value.message,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.redAccent,
                        ));
                      } else {
                        // Navigates to the landing page on successful login.
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LandingPage();
                            },
                          ),
                        );
                      }
                    },
                  );
                },
                child: const Text(
                  "LOGIN",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
