
import 'package:firebase/models/brew.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home
({ Key? key }) : super(key: key);

  @override
  final AuthService _auth = AuthService(); // instance _auth needs to be called file
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid : '').brews,
      child: Scaffold(
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
        body: BrewList(),
      ),
    );
  }
}