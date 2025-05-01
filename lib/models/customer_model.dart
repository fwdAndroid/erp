import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String customerName;
  String customerEmail;
  String customerBussinessName;
  String customerPhoneNumber;
  String currency;
  String taxCategory;
  String taxId;

  // Billing Address
  String billingCountry;
  String billingAddress;
  String billingCity;

  // Shipping Address
  String shippingAddress;
  String shippingCity;
  String shippingCountry;

  // Item
  List<Map<String, dynamic>> items;

  // User
  String uid;
  String uuid;

  // Date
  String assignedDate;

  CustomerModel({
    required this.uid,
    required this.customerName,
    required this.customerEmail,
    required this.assignedDate,
    required this.customerBussinessName,
    required this.customerPhoneNumber,
    required this.currency,
    required this.taxCategory,
    required this.taxId,
    required this.billingCountry,
    required this.billingAddress,
    required this.billingCity,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingCountry,
    required this.items,
    required this.uuid,
  });

  Map<String, dynamic> toJson() => {
    'customerName': customerName,
    'uid': uid,
    'uuid': uuid,
    'customerEmail': customerEmail,
    'customerBussinessName': customerBussinessName,
    'customerPhoneNumber': customerPhoneNumber,
    'currency': currency,
    'taxCategory': taxCategory,
    'taxId': taxId,
    'billingCountry': billingCountry,
    'billingAddress': billingAddress,
    'billingCity': billingCity,
    'assignedDate': assignedDate,
    'shippingAddress': shippingAddress,
    'shippingCity': shippingCity,
    'shippingCountry': shippingCountry,
    'items': items,
  };

  static CustomerModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;
    return CustomerModel(
      customerName: snapshot['customerName'],
      uid: snapshot['uid'],
      uuid: snapshot['uuid'],
      customerEmail: snapshot['customerEmail'],
      customerBussinessName: snapshot['customerBussinessName'],
      customerPhoneNumber: snapshot['customerPhoneNumber'],
      currency: snapshot['currency'],
      taxCategory: snapshot['taxCategory'],
      assignedDate: snapshot['assignedDate'],
      taxId: snapshot['taxId'],
      billingCountry: snapshot['billingCountry'],
      billingAddress: snapshot['billingAddress'],
      billingCity: snapshot['billingCity'],
      shippingAddress: snapshot['shippingAddress'],
      shippingCity: snapshot['shippingCity'],
      shippingCountry: snapshot['shippingCountry'],
      items: List<Map<String, dynamic>>.from(snapshot['items']),
    );
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerName: json['customerName'],
      uid: json['uid'],
      uuid: json['uuid'],
      customerEmail: json['customerEmail'],
      assignedDate: json['assignedDate'],
      customerBussinessName: json['customerBussinessName'],
      customerPhoneNumber: json['customerPhoneNumber'],
      currency: json['currency'],
      taxCategory: json['taxCategory'],
      taxId: json['taxId'],
      billingCountry: json['billingCountry'],
      billingAddress: json['billingAddress'],
      billingCity: json['billingCity'],
      shippingAddress: json['shippingAddress'],
      shippingCity: json['shippingCity'],
      shippingCountry: json['shippingCountry'],
      items: List<Map<String, dynamic>>.from(json['items']),
    );
  }
}
