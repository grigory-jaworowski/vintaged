import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/data/repositories/user/user_repository.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';

import '../../../../data/services/climatiq_api_service.dart';
import '../../../authentication/models/user_model.dart';

class ProductDetailsController extends GetxController {
  static ProductDetailsController get instance => Get.find();

  final userRepository = UserRepository.instance;
  final userController = UserController.instance;
  Rx<UserModel> productOwner = UserModel.empty().obs;

  // Call the ClimatiqApiService to get the total CO2
  final climatiqApiService = Get.put(ClimatiqApiService());

  // CO₂ related state
  RxDouble totalCO2Value = 0.0.obs;
  Rx<Color> co2Color = Colors.green.obs;

  Future<void> fetchOwnerRecord(String ownerId) async {
    try {
      productOwner(await userRepository.fetchUserById(ownerId));
    } catch (e) {
      productOwner(UserModel.empty());
    }
  }

  Future<void> setTotalCO2Value(double weight, double co2) async {
    try {
      double freightCO2 = await climatiqApiService.estimateTotalCO2(
        co2: co2,
        weight: weight,
        ownerPostalCode: productOwner.value.address?.postalCode ?? "",
        buyerPostalCode: userController.user.value.address?.postalCode ?? "",
      );

      totalCO2Value.value = freightCO2;

      updateCO2Color(freightCO2);
    } catch (e) {
      totalCO2Value.value = 0.0;
    }
  }

  void updateCO2Color(double value) {
    if (value < 10) {
      co2Color.value = Colors.green; // Low CO2 impact
    } else if (value >= 10 && value <= 50) {
      co2Color.value = Colors.yellow; // Moderate CO2 impact
    } else {
      co2Color.value = Colors.red; // High CO2 impact
    }
  }
}
