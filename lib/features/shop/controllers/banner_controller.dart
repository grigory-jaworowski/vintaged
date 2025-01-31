import 'package:get/get.dart';

import '../../../data/repositories/banners/banners_repositories.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> allBanners = <BannerModel>[].obs;
  final carouselCurrentIndex = 0.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Banners from data source
      final banners = await _bannerRepository.getAllBanners();

      // Update the categories list
      allBanners.assignAll(banners);
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}