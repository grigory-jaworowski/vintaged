import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveAddress(AddressModel address, String userId) async {
    try {
      // Convert AddressModel to JSON
      Map<String, dynamic> addressJson = address.toJson();

      // Update the existing 'address' field in the Users collection
      await _db
          .collection('Users')
          .doc(userId)
          .update({'Address': addressJson});

    } catch (e) {
      throw 'Something went wrong while saving Address Information. Try again later';
    }
  }
}
