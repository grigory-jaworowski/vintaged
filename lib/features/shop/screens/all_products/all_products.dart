 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/layouts/grid_layout.dart';
import 'package:vintaged/common/widgets/products/product_card/product_card.dart';
import 'package:vintaged/features/shop/models/product_model.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/vertical_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/all_products_controller.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  // The title of the screen.
  final String title;

  // Represents a query to fetch products from the database.
  // Use the query parameter to apply custom sorting or filtering criteria.
  final Query? query;

  // Represents a function to fetch products as a future.
  // If you use this futureMethod function, it does not allow custom sorting or filtering from the database.
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: VAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (_, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = VerticalProductShimmer(itemCount: 6);
              final widget = VCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found!
              final products = snapshot.data!;
              return VSortableProductList(products: products);
            },
          ),
        ),
      ),
    );
  }
}

// Represents a sortable list of products that can be filtered and sorted.
// You can also perform sorting directly from the database using [ProductRepository.filterProducts].
class VSortableProductList extends StatelessWidget {
  const VSortableProductList({
    super.key,
    required this.products,
  });

  /// The list of products to be displayed.
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    controller.assignProducts(products);

    return Column(
      children: [
        /// -- Sort & Filter Section
        Row(
          children: [
            Obx(
              () => Expanded(
                child: DropdownButtonFormField(
                  isExpanded: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  value: controller.selectedSortOption.value,
                  onChanged: (value) {
                    // Sort products based on the selected option
                    controller.sortProducts(value!);
                  },
                  items: ['Name', 'Higher Price', 'Lower Price', 'Popularity'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwSections),

        // Product Grid Section
        Obx(
          () => VGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => VProductCard(product: controller.products[index]),
          ),
        ),

        // Bottom spacing to accommodate the navigation bar
        const SizedBox(height: 56 + VSizes.defaultSpace),
      ],
    );
  }
}
