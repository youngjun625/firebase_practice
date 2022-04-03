import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance; // _means privat, only used in this file

  // sign in anon
  // this is a anonymous sign-in metho for AuthService class. when this method
  // is called, it will create a userCrendential object, store it into result
  // then we can create a user object from result, and return it back to whatever we need
  Future signInAnon() async {
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email and pw

  // register with email and pw

  // sign out

}
