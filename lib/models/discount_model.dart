import 'package:cloud_firestore/cloud_firestore.dart';

class DiscountModel {
  String discountType;
  String uid;
  double discountValue;
  String discountName;
  String uuid;

  DiscountModel({
    required this.uid,
    required this.discountType,
    required this.discountValue,
    required this.discountName,
    required this.uuid,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
    'discountType': discountType,
    'uid': uid,
    'uuid': uuid,
    'discountValue': discountValue,
    'discountName': discountName,
  };

  ///
  static DiscountModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return DiscountModel(
      discountType: snapshot['discountType'],
      uuid: snapshot['uuid'],
      uid: snapshot['uid'],
      discountValue: snapshot['discountValue'],
      discountName: snapshot['discountName'],
    );
  }
}
