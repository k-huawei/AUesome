import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'dashboard.dart';
import 'main.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Page',
            ),
            TextField(
              obscureText: false,
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // 1. Get the username(email) and password
                  //print(value.user!.uid);
                  print(emailController.text);
                  print(passwordController.text);

                  // 2. Call Firebase authenticaiton and verify the username and password
                  FirebaseAuth.instance.signInWithEmailAndPassword( email: emailController.text, password: passwordController.text)
                      .then((value) {
                    print("You have successfully logged in");
                    // go to home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page')),
                    );
                  }).catchError((e) {
                    print("Failed to Login");
                    print(e);

                  });
                },
                child: Text('Login')
            ),
            ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage(title: 'Signup Page')),
                  );
                },
                child: Text('Signup')
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
