import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String street;
  String city;
  String province;
  String postalCode;
  String country;

  AddressModel({
    required this.street,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.country,
  });


  static AddressModel empty() => AddressModel(street: '', city: '', province: '', postalCode: '', country: '');


  Map<String, dynamic> toJson() {
    return {
      'Street': street,
      'City': city,
      'Province': province,
      'PostalCode': postalCode,
      'Country': country,
    };
  }


  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      street: data['Street'] as String,
      city: data['City'] as String,
      province: data['Province'] as String,
      postalCode: data['PostalCode'] as String,
      country: data['Country'] as String,
    );
  }

  // Factory constructor to create an AddressModel from a DocumentSnapshot
  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      province: data['Province'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
    );
  }

  @override
  String toString() {
    return '$street, $city, $province $postalCode, $country';
  }
}
