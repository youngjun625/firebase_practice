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
  //   L22 
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
          //  dropdown
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
          SizedBox(height: 20),
          //slider //   L23 slider widget!
          Slider(
            min: 100, //   these numbers represent darkness of color
            max: 900,
            divisions: 8,
            value: (_currentStrength ?? 100).toDouble(), //   setting up base value. if non null, _current, if null base with 100
            onChanged: (val) => setState(() {
              _currentStrength = val.round(); //   val of slider is given as doubles, so we use round to make it as Int type
            }),
            activeColor: Colors.brown[_currentStrength ?? 100], //   might be null, so we put a fallback value
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            ),
          SizedBox(height: 20),
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