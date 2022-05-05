import 'package:flutter/material.dart';
import 'package:firebase/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({ Key? key }) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  //todo L22 
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please anter a name' : null,
            onChanged: (val) => setState(() {
              _currentName = val;
            })
          ),
          SizedBox(height: 20),
          //tododropdown
          DropdownButtonFormField( 
            decoration: textInputDecoration,
            value: _currentSugars ?? '0', //value shown when not selected. if _currentSugars = null, '0' as 기본
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
                );
            }).toList(), 
            onChanged:(val) => setState(() {
              _currentSugars = val.toString();
            }) ),
          //slider
          ElevatedButton( 
            onPressed: () async {
              print("name: $_currentName");
              print("sugars: $_currentSugars");
              print("strength: $_currentStrength");
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
}