import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import 'widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(VSizes.defaultSpace),
        child: VOrderListItems(),
      ),
    );
  }
}