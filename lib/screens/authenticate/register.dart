import 'package:firebase/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';

class Register extends StatefulWidget {

  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  // L12
  final _formKey = GlobalKey<FormState>();

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
        title: Text("Sign Up to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: _formKey, // keeps track of form and state of it. needed to validation
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                //todo L14 hint texts, what to type?
                decoration: textInputDecoration.copyWith(hintText: "Email"), //copies the entire constant but passes a parameter with it!
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
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'Enter a password 6+ long' : null, // validaotr is VALID if NULL
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton( 
                onPressed: () async { 
                  if(_formKey.currentState!.validate()){ // if ALL validators are NULL, then it will return true
                    dynamic result = await _auth.registerWithEmailAndPw(email, password);
                    if(result == null){
                      setState(() {
                        error = "please supply a valid email";
                      });
                    }
                    else{ // popping register form to show home page
                      Navigator.pop(context);
                    }
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400]),
                child: Text(
                  'Register',
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