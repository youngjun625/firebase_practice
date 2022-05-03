import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home
({ Key? key }) : super(key: key);

  @override
  final AuthService _auth = AuthService(); // instance _auth needs to be called file
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () async{
              await _auth.signOut(); // user instance in wrapper becomes null
            }, 
            icon: Icon(Icons.person),  
            label: Text('logout'),
            )
        ], //  buttons appear on right of the app bar
      ),
    );
  }
}