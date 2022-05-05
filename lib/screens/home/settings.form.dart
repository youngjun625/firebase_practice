import 'package:firebase/models/user.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({ Key? key }) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  //   L22 
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context); //we first get a user model to know the uid of THIS user

    // :25
    return StreamBuilder<MyUserData>( //when we need to listen to streams changes in just a single widget, we can use built in StreamBuilder method instead of the Provider package
      // we are getting back a MyUserData object back whenever stream detects change
      stream: DatabaseService(uid: user!.uid).userData, // this is a userData Stream from database.dart that returns MyUserData 
      builder: (context, snapshot) {
        if(snapshot.hasData){ // if check to make sure snapshot is not null
          
          MyUserData? myUserData = snapshot.data;

          return Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'update your brew settings.',
                style: TextStyle(fontSize: 18), 
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: myUserData!.name,
                decoration: textInputDecoration,
                validator: (val) => val!.isEmpty ? 'Please anter a name' : null,
                onChanged: (val) => setState(() {
                  _currentName = val;
                })
              ),
              SizedBox(height: 20),
              //  dropdown
              DropdownButtonFormField( 
                decoration: textInputDecoration,
                value: _currentSugars ?? myUserData.sugars, //todo value shown when not selected now has a fallback of originally stored data from firecloud
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                    );
                }).toList(), 
                onChanged:(val) => setState(() {
                  _currentSugars = val.toString();
                }) ),
              SizedBox(height: 20),
              //slider //   L23 slider widget!
              Slider(
                min: 100, //   these numbers represent darkness of color
                max: 900,
                divisions: 8,
                value: (_currentStrength ?? myUserData.strength).toDouble(), //   setting up base value. if non null, _current, if null base with 100
                onChanged: (val) => setState(() {
                  _currentStrength = val.round(); //   val of slider is given as doubles, so we use round to make it as Int type
                }),
                activeColor: Colors.brown[_currentStrength ?? myUserData.strength], //   might be null, so we put a fallback value
                inactiveColor: Colors.brown[_currentStrength ?? myUserData.strength],
                ),
              SizedBox(height: 20),
              ElevatedButton( 
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    await DatabaseService(uid: myUserData.uid).updateUserData(
                      _currentSugars?? myUserData.sugars, 
                      _currentName ?? myUserData.name,  //todo if left = null '??' provides right value
                      _currentStrength ?? myUserData.strength); //todo if _current is not changed, we update NULL value, therefore we update a fallback value which is original value.
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400]),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ) 
              ),
            ],
          ),
        );
        }
        else{
          return Loading();
        }
        
      }
    );
  }
}