import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew.dart';
import 'package:firebase/models/user.dart';
//L16 setting up database services
class DatabaseService {
  // L17
  late final String uid;
  DatabaseService({required this.uid}); //when Database function is called, must need uid parameter to be passed

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
    //notice that the document ID in firestore data base = UID of this user
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){ // maps the Query received by firestore first
      return Brew(  //  creates a Brew object with all the datas
        name: (doc.data() as dynamic)['name'] ?? '',
        strength: (doc.data() as dynamic)['strength'] ?? 0,
        sugars: (doc.data() as dynamic)['sugars'] ?? '0',
      );
    }).toList(); //  makes it into list of Brews
  }

  //todo userData from firecloud snapshot
  MyUserData _myUserDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserData(
      uid: uid, 
      name: (snapshot.data() as dynamic)['name'], 
      sugars: (snapshot.data() as dynamic)['sugars'], 
      strength: (snapshot.data() as dynamic)['strength'],
      );
  }

  //get brews stream, setting up database stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
    //  we're listening to list of brews coming in. so we need to make changes in home -> streamprovider as well
  }

  //todo L 24 get user document stream, setted up name, brew data etc 
  Stream<MyUserData> get userData {
    return brewCollection.doc(uid).snapshots() //todo were getting snapshots of specific document of specific uid
      .map(_myUserDataFromSnapshot); //take dictionary data from firecloud/snapshot and map into _myUser...
  }


}