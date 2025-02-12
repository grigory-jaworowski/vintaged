import 'package:cloud_firestore/cloud_firestore.dart';

import '../../personalization/models/address_model.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  AddressModel? address;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.phoneNumber,
      required this.email,
      required this.profilePicture,
      this.address});

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Function to split full name into first and last
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      phoneNumber: '',
      email: '',
      profilePicture: '');

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Address': address,
    };
  }

  // Method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          username: data['Username'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          address: data['Address'] != null
              ? AddressModel.fromMap(data['Address'])
              : AddressModel.empty());
    } else {
      return UserModel.empty();
    }
  }
}
