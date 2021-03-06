import 'package:flutter/material.dart';
import 'package:firebase/models/brew.dart';
//  L20
class BrewTile extends StatelessWidget {

  final Brew brew;
  BrewTile({ required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength], // control the color with the integer
            backgroundImage: AssetImage('assets/coffee_icon.png'), //todo L27
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ), // search for 'materials' on flutter
      )
    );
  }
}