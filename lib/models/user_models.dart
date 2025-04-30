import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String uid;
  String password;
  String phoneNumber;
  String fullName;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
    'email': email,
    'uid': uid,
    'password': password,
    'phoneNumber': phoneNumber,
    'fullName': fullName,
  };

  ///
  static UserModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      uid: snapshot['uid'],
      password: snapshot['password'],
      phoneNumber: snapshot['phoneNumber'],
      fullName: snapshot['fullName'],
    );
  }
}
