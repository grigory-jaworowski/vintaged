import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchController = Get.put(VSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text('Search', style: Theme.of(context).textTheme.headlineMedium),
        actions: [TextButton(onPressed: () => Get.back(), child: const Text('Cancel'))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Search bar & Filter Button
              Row(
                children: [
                  /// Search
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      onChanged: (search) => searchController.searchProducts(search),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              /// Search
              Obx(
                () => searchController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    :
                    // Show search if not Empty
                    searchController.searchResults.isNotEmpty
                        ? VGridLayout(
                            itemCount: searchController.searchResults.length,
                            itemBuilder: (_, index) => VProductCard(product: searchController.searchResults[index]),
                          )
                        : const Center(child: Text('No Items Found!')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}