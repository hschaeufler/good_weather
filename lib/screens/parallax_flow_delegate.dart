
import 'package:flutter/material.dart';

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.controller,
    required this.buildContext,
    required this.backgroundImageKey,
  }) : super(repaint: controller);

  final DraggableScrollableController controller;
  final BuildContext buildContext;
  final GlobalKey backgroundImageKey;

  @override
  void paintChildren(FlowPaintingContext context) {
    double scrollFraction = controller.size * 2 - 1;
    double opacity = 1 - scrollFraction / 3;
    double height = context.size.height;
    double pixels = scrollFraction * (height / 10);

      // Paint the background.
      context.paintChild(
        0,
        transform: Transform.translate(
          offset: Offset(0, pixels),
        ).transform,
        opacity: opacity,
      );

  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return controller != oldDelegate.controller ||
        buildContext != oldDelegate.buildContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
