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

  // auth change user stream
  Stream<MyUser?> get my_user{ //were setting up a stream were we 'get' <MyUser> data back
    return _auth.authStateChanges()
    //.map((User? my_user) => _userFromFirebase(my_user)); this functions the same as below
    .map (_userFromFirebase);
  } 
  // authStateChanges() will retun me a User data, when authstate changes, 
  // I map the returned User data into MyUser data which only contains the info i need
  
  //sign in anon
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
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }

}
