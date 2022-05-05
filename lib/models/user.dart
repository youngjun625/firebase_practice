class MyUser {

  late final String uid;

  MyUser({required this.uid});

}
// creating user DATA class to create objects with firecloud datas
class MyUserData{

  late final String uid;
  late final String name;
  late final String sugars;
  late final int strength;

  MyUserData({required this.uid, required this.name, required this.sugars, required this.strength});

}