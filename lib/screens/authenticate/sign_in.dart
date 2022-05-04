import 'package:firebase/models/user.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/shared/constants.dart';
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
  final _formKey = GlobalKey<FormState>(); // L13

  //create variables to store what is typed in
  String email = '';
  String password = '';
  String error = '';

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
              color: Color.fromARGB(255, 35, 34, 34) ),
            label: Text("Register",
              style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                onChanged: (value) { //this functions runs everytime there is a change, type, etc
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField( 
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (value) => value!.length < 6 ? 'Enter a password 6+ long' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async { // sign in with email and pw
                  if(_formKey.currentState!.validate()){ // if ALL validators are NULL, then it will return true
                    dynamic result = await _auth.signInWithEmailAndPw(email, password);
                    if(result == null){
                      setState(() {
                        error = "Failed to Log In";
                      });
                    }
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400]),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ) 
              ),
              SizedBox(height: 12),
              Text(error,
              style: TextStyle(color: Colors.red, fontSize:14),)
            ],
          ),)
      ),
    );
  }
}