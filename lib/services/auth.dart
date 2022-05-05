import 'package:firebase/models/user.dart';
import 'package:firebase/services/database.dart';
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
      print("UID: ${my_user?.uid}");
      return _userFromFirebase(my_user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email and pw //L13 sign in
  Future signInWithEmailAndPw(String email, String password) async{
    try { //creating email and password user
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? my_user = result.user;
      print("UID: ${my_user?.uid}");
      return _userFromFirebase(my_user);
    } catch(e){ 
        print(e.toString());
        return null;
      }
  }

  // register with email and pw
  Future registerWithEmailAndPw(String email, String password) async{
    try { //creating email and password user
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password) ;
      User? my_user = result.user;
      print("UID: ${my_user?.uid}");
      //create a new document for the user with this uid
      await DatabaseService(uid: my_user!.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebase(my_user);
    } catch(e){ 
        print(e.toString());
        return null;
      }
  }

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
