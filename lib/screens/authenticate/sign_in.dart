import 'package:firebase/models/user.dart';
import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: ElevatedButton(
          child: Text('Sign in Anonymously'),
          onPressed: () async {
            // dynamic because it could be either User or null
            dynamic result = await _auth.signInAnon(); 
            if (result == null){
              print("error signing in");
            } else {
              print("signed in");
              print(result.uid);
            }
          }
        ),
      ),
    );
  }
}