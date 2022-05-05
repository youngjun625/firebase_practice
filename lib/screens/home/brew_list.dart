import 'package:firebase/models/brew.dart';
import 'package:firebase/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//setting up streams for firestore
class BrewList extends StatefulWidget {
  const BrewList({ Key? key }) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    //todo L20 
    final brews = Provider.of<List<Brew>?>(context);
    if (brews != null) {
      return  ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews[index]);
        }
      );
    }
    else{
      return Container();
    }
  }
}