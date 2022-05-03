import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    print('hi + $user');
    
    //depending on authentication state, do i go to sign in page? or home page?
    // we're gonna be using stream
    if (user == null) {
      return Authenticate();
    }
    else{
      return Home();
    }
  
  }
}