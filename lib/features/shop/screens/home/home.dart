import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:vintaged/features/shop/screens/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  VHomeAppBar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}