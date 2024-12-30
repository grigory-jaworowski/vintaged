import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/features/shop/screens/home/home.dart';
import 'package:vintaged/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: VColors.white,
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home, color: VColors.black), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop, color: VColors.black), label: 'Market'),
            NavigationDestination(icon: Icon(Iconsax.heart, color: VColors.black), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user, color: VColors.black), label: 'Profile'),
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), Container(color: Colors.blue,), Container(color: Colors.blueAccent,), Container(color: Colors.blueGrey,)];
}