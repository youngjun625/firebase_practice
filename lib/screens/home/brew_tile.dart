import 'package:flutter/material.dart';
import 'package:firebase/models/brew.dart';
//todo L20
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
            backgroundColor: Colors.brown[brew.strength], //todo control the color with the integer
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ), //todo search for 'materials' on flutter
      )
    );
  }
}