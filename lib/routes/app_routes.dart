import 'package:get/get.dart';
import 'package:vintaged/features/personalization/screens/add_new_address.dart';
import 'package:vintaged/features/market/screens/order/order.dart';
import 'package:vintaged/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: VRoutes.changeAddress, page: () => const AddNewAddressScreen()),
    GetPage(name: VRoutes.orders, page: () => const OrderScreen()),
  ];
}