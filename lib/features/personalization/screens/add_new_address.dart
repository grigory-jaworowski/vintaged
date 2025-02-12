import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../utils/validators/validators.dart';
import '../controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar:
          const VAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.street,
                  validator: (value) =>
                      Validator.validateEmptyText('Street', value),
                  decoration: const InputDecoration(
                    labelText: 'Street',
                    prefixIcon: Icon(Iconsax.building_31),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.postalCode,
                  validator: (value) =>
                      Validator.validatePostalCode(value),
                  decoration: const InputDecoration(
                    labelText: 'Postal Code',
                    prefixIcon: Icon(Iconsax.code),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.city,
                  validator: (value) =>
                      Validator.validateEmptyText('City', value),
                  decoration: const InputDecoration(
                    labelText: 'City',
                    prefixIcon: Icon(Iconsax.building),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.province,
                  decoration: const InputDecoration(
                    labelText: 'Province',
                    prefixIcon: Icon(Iconsax.activity),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      Validator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddresses(),
                      child: const Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
