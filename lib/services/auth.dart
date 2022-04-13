import 'package:firebase/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance; // _means privat, only used in this file

  //create user object based on User(firebase)
  MyUser? _userFromFirebase(User? user){
    return user != null ? MyUser(uid: user.uid) : null;
  } 
  //created a MyUser instance with uid from (firebase) User class

 
  Future signInAnon() async {
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? my_user = result.user;
      return _userFromFirebase(my_user);
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
