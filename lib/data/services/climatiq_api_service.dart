import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';

class ClimatiqApiService extends GetxController {
  static ClimatiqApiService get instance => Get.find();

  Future<double> estimateCO2({required double weight}) async {
    try {
      final response = await http.post(
        Uri.parse(VAPIs.climatiqApiUrl),
        headers: {
          'Authorization': 'Bearer ${VAPIs.climatiqApiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "emission_factor": {
            "activity_id": VAPIs.climatiqReusedClothesActivityId,
            "data_version": "^0"
          },
          "parameters": {
            "weight": weight,
            "weight_unit": VAPIs.climatiqReusedClothesWeightUnitParam
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data["co2e"] as num?)?.toDouble() ?? 0.0;
      } else {
        throw Exception('Failed to fetch CO₂ data: ${response.body}');
      }
    } catch (e) {
      return 0.0;
    }
  }

  Future<double> estimateTotalCO2({
    required double co2, // Already calculated clothing CO₂
    required double weight,
    required String ownerPostalCode,
    required String buyerPostalCode,
    String vehicleType = "van",
    String vehicleWeight = "lte_3.5t",
    String fuelSource = "petrol",
  }) async {
    try {
      final freightRequest = await http.post(
        Uri.parse(VAPIs.climatiqFreightApiUrl),
        headers: {
          'Authorization': 'Bearer ${VAPIs.climatiqApiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "route": [
            {
              "location": {"query": VAPIs.spain, "postal_code": ownerPostalCode}
            },
            {
              "transport_mode": "road",
              "leg_details": {
                "rest_of_world": {
                  "vehicle_type": vehicleType,
                  "vehicle_weight": vehicleWeight,
                  "fuel_source": fuelSource
                }
              }
            },
            {
              "location": {"query": VAPIs.spain, "postal_code": buyerPostalCode}
            }
          ],
          "cargo": {"weight": weight, "weight_unit": VAPIs.climatiqReusedClothesWeightUnitParam}
        }),
      );

      double freightCO2 = 0.0;

      // Process freight response
      if (freightRequest.statusCode == 200) {
        final data = jsonDecode(freightRequest.body);
        freightCO2 = (data["co2e"] as num?)?.toDouble() ?? 0.0;
      } else {
        throw Exception(
            'Failed to fetch freight CO₂ data: ${freightRequest.body}');
      }

      // Return total CO₂ (clothing + shipping)
      return co2 + freightCO2;
    } catch (e) {
      return 0.0;
    }
  }
}
