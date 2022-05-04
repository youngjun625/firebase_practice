import 'package:cloud_firestore/cloud_firestore.dart';
//todo L16 setting up database services
class DatabaseService {

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  //will automatically create 'brews' collection in firestore

}