import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/models/customer_model.dart';
import 'package:erp/models/discount_model.dart';
import 'package:erp/models/tax_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Database {
  var uuid = Uuid().v4();
  //Register User with Add User
  Future<String> addTax({
    required String taxName,
    required String taxDescription,
    required double taxPercentage,
  }) async {
    String res = 'Some error occured';
    try {
      //Add User to the database with modal
      TaxModel userModel = TaxModel(
        taxName: taxName,
        uid: FirebaseAuth.instance.currentUser!.uid,
        taxDescription: taxDescription,
        uuid: uuid,
        taxPercentage: taxPercentage,
      );
      await FirebaseFirestore.instance
          .collection('goals')
          .doc(uuid)
          .set(userModel.toJson());
      res = 'sucess';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Add Discount
  Future<String> addDiscount({
    required String discountName,
    required String discountType,
    required double discoutValue,
  }) async {
    String res = 'Some error occured';
    try {
      //Add User to the database with modal
      DiscountModel userModel = DiscountModel(
        discountName: discountName,
        uid: FirebaseAuth.instance.currentUser!.uid,
        discountType: discountType,
        uuid: uuid,
        discountValue: discoutValue,
      );
      await FirebaseFirestore.instance
          .collection('discount')
          .doc(uuid)
          .set(userModel.toJson());
      res = 'sucess';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> addCustomer({
    required String customerName,
    required String customerBussinessName,
    required String currency,
    required String taxCategory,
    required String taxId,
    required String billingCountry,
    required String billingAddress,
    required String billingCity,
    required String shippingAddress,
    required String shippingCity,
    required String shippingCountry,
    required List<Map<String, dynamic>> items,
    required String customerEmail,
    required String customerPhoneNumber,
  }) async {
    String res = 'Some error occurred';
    try {
      String uuid = Uuid().v4();
      CustomerModel userModel = CustomerModel(
        customerName: customerName,
        uid: FirebaseAuth.instance.currentUser!.uid,
        customerBussinessName: customerBussinessName,
        uuid: uuid,
        currency: currency,
        customerEmail: customerEmail,
        customerPhoneNumber: customerPhoneNumber,
        taxCategory: taxCategory,
        taxId: taxId,
        billingCountry: billingCountry,
        billingAddress: billingAddress,
        billingCity: billingCity,
        shippingAddress: shippingAddress,
        shippingCity: shippingCity,
        shippingCountry: shippingCountry,
        items: items,
      );
      await FirebaseFirestore.instance
          .collection('customer')
          .doc(uuid)
          .set(userModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
