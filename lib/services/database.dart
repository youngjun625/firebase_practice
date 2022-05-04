import 'package:cloud_firestore/cloud_firestore.dart';
//L16 setting up database services
class DatabaseService {
  //todo L17
  late final String uid;
  DatabaseService({required this.uid}); //todowhen Database function is called, must need uid parameter to be passed

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  //will automatically create 'brews' collection in firestore

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name' : name,
      'strength' : strength,
    });
    //uid passed into document method, if it doesn exist, automatically create document with the given uid
    //if document of uid exists, it links the document of that uid
    //todo notice that the document ID in firestore data base = UID of this user
  }

}