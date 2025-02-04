import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';

class ClimatiqApiService {
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
      print('CO₂ Estimation Error: $e');
      return 0.0; // Return 0.0 if API call fails
    }
  }
}