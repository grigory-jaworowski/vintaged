import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VHelperFunctions {
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}