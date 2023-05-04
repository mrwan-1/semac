import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String ownerName;
  String serviceName;
  String ownerPhoneNumber;
  String servicePhoneNumber;
  String? bankAccountType;
  String bankAccountNumber;
  String? region;
  String address;
  String? imageFilename;
  String? imageUrl;

  UserModel({
    required this.id,
    this.imageFilename,
    this.imageUrl,
    required this.ownerName,
    required this.serviceName,
    required this.ownerPhoneNumber,
    required this.servicePhoneNumber,
    required this.bankAccountType,
    required this.bankAccountNumber,
    required this.region,
    required this.address,
  });

  factory UserModel.fromJson(QueryDocumentSnapshot<UserModel> snapshot) =>
      UserModel(
        id: snapshot.data().id,
        imageFilename: snapshot.data().imageFilename,
        imageUrl: snapshot.data().imageUrl,
        ownerName: snapshot.data().ownerName,
        serviceName: snapshot.data().serviceName,
        ownerPhoneNumber: snapshot.data().ownerPhoneNumber,
        servicePhoneNumber: snapshot.data().servicePhoneNumber,
        bankAccountType: snapshot.data().bankAccountType,
        bankAccountNumber: snapshot.data().bankAccountNumber,
        region: snapshot.data().region,
        address: snapshot.data().address,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ownerName'] = ownerName;
    data['imageFilename'] = imageFilename;
    data['imageUrl'] = imageUrl;
    data['serviceName'] = serviceName;
    data['ownerPhoneNumber'] = ownerPhoneNumber;
    data['servicePhoneNumber'] = servicePhoneNumber;
    data['bankAccountType'] = bankAccountType;
    data['bankAccountNumber'] = bankAccountNumber;
    data['region'] = region;
    data['address'] = address;

    return data;
  }
}
