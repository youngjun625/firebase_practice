import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
//todo setting up streams for firestore
class BrewList extends StatefulWidget {
  const BrewList({ Key? key }) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<QuerySnapshot?>(context);
    //print(brews?.docs);
    if (brews?.docs != null) 
    {
      for (var doc in brews!.docs){
        print(doc.data()); 
      }
    }

    return Container(
      
    );
  }
}