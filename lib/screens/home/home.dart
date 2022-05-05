
import 'package:firebase/models/brew.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/screens/home/settings.form.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home ({ Key? key }) : super(key: key);
  final AuthService _auth = AuthService(); // instance _auth needs to be called file

  @override
  
  Widget build(BuildContext context) {

    void _showSettingsPanel(){ //  bottom sheet function
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: SettingsForm(),
      );
    });
  }
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
              ),
              TextButton.icon( //  L21 Bottom Sheets
              onPressed: () async{
                _showSettingsPanel();
              }, 
              icon: Icon(Icons.settings),  
              label: Text('settings'),
              )
          ], //  buttons appear on right of the app bar
        ),
        body: BrewList(),
      ),
    );
  }
}