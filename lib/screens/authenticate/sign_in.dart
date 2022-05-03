import 'package:firebase/models/user.dart';
import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // constructor always takes place inside the widget itself, not the state object
  final toggleView;
  const SignIn({ Key? key, this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  //create variables to store what is typed in
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign in to Brew Crew"),
        // L11
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            }, 
            icon: Icon(Icons.person,
              color: Colors.white ),
            label: Text("Register",
              style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) { //this functions runs everytime there is a change, type, etc
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField( 
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                }, 
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400]),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ) 
              )
            ],
          ),)
      ),
    );
  }
}