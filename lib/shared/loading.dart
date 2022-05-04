import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//todo L15
class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.brown,
          size: 50,
        ),)
      
    );
  }
}