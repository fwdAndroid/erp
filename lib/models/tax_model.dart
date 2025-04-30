import 'package:cloud_firestore/cloud_firestore.dart';

class TaxModel {
  String taxName;
  String uid;
  double taxPercentage;
  String taxDescription;
  String uuid;

  TaxModel({
    required this.uid,
    required this.taxName,
    required this.taxPercentage,
    required this.taxDescription,
    required this.uuid,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
    'taxName': taxName,
    'uid': uid,
    'uuid': uuid,
    'taxPercentage': taxPercentage,
    'taxDescription': taxDescription,
  };

  ///
  static TaxModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return TaxModel(
      taxName: snapshot['taxName'],
      uuid: snapshot['uuid'],
      uid: snapshot['uid'],
      taxPercentage: snapshot['taxPercentage'],
      taxDescription: snapshot['taxDescription'],
    );
  }
}
