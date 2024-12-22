import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:vintaged/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VPrimaryHeaderContainer extends StatelessWidget {
  const VPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VCurvedEdgeWidget(
      child: Container(
        color: VColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              // Custom background shapes
              Positioned(top: -150, right: -250, child: VCircularContainer(backgroundColor: VColors.textWhite.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child: VCircularContainer(backgroundColor: VColors.textWhite.withOpacity(0.1))),
            ],
          ),
        ),
      ),
    );
  }
}