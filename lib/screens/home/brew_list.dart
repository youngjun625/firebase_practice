import 'package:firebase/models/brew.dart';
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

    final brews = Provider.of<List<Brew>?>(context);
    //print(brews?.docs);
    if (brews != null)
    {
      brews.forEach((brew){
        print(brew.name);
        print(brew.sugars);
        print(brew.strength);
        //todo now were working with Brew object, not the query directly recieved by firestore
      });
    }

    return Container(
      
    );
  }
}