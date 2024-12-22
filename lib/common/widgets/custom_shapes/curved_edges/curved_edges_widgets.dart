import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class VCurvedEdgeWidget extends StatelessWidget {
  const VCurvedEdgeWidget({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VCustomCurvedEdges(),
      child: child
    );
  }
}