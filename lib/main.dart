import 'package:firebase/models/user.dart';
import 'package:firebase/screens/wrapper.dart';
import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //to use firebas_auth we need this
import 'package:provider/provider.dart'; // to use Stream provider

void main() async{
  // next two lines are needed to use firebase_auth
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value( // 3)what kind of data type are we listening to? 'MyUser' data
      value: AuthService().my_user, // 1) value of StreamProvider is the Stram value my_user inside AuthService Class
      // 2) I'm listening to the my_user instance for authentication changes
      initialData: null, // required
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
