import 'package:get/get.dart';
import 'package:vintaged/features/personalization/screens/profile.dart';
import 'package:vintaged/features/personalization/screens/settings.dart';
import 'package:vintaged/features/shop/notifications/notifications.dart';
import 'package:vintaged/features/shop/screens/sell_product/sell_product.dart';
import 'package:vintaged/features/shop/screens/categories/categories.dart';
import 'package:vintaged/features/shop/screens/home/home.dart';
import 'package:vintaged/features/shop/screens/wishlist/wishlist.dart';
import 'package:vintaged/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: VRoutes.home, page: () => const HomeScreen()),
    GetPage(name: VRoutes.addItem, page: () => const SellProduct()),
    GetPage(name: VRoutes.market, page: () => const CategoriesScreen()),
    GetPage(name: VRoutes.notifications, page: () => const NotificationsScreen()),
    GetPage(name: VRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: VRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: VRoutes.wishlist, page: () => const WishlistScreen()),
  ];
}