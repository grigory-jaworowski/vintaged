import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';
import 'package:vintaged/features/market/controllers/my_items_controller.dart';
import 'package:vintaged/features/market/controllers/payment_controller.dart';
import 'package:vintaged/features/market/models/product_model.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/order/order_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/pricing_calculator.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/address_controller.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final addressController = Get.put(AddressController());
  final paymentController = Get.put(PaymentController());
  final orderRepository = Get.put(OrderRepository());
  final itemsController = Get.put(MyItemsController());
  final userController = UserController.instance;

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      VLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(ProductModel product) async {
    try {
      // Start Loader
      VFullScreenLoader.openLoadingDialog(
          'Processing your order', VImages.pencilAnimation);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: VPricingCalculator.calculateTotalPrice(product.price, 'ES')
            .toDouble(),
        orderDate: DateTime.now(),
        shippingAddress: userController.user.value.address,
        paymentMethod: paymentController.selectedPaymentMethod.value.name,
        deliveryDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 7),
        shippingCost: VPricingCalculator.getShippingCost('ES'),
        taxCost: VPricingCalculator.getTaxRateForLocation('ES'),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      await itemsController.performDelete(product);

      // Show Success screen
      Get.off(() => SuccessScreen(
            image: VImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subtitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
