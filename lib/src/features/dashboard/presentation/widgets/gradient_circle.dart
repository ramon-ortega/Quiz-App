import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  const GradientCircle({
    super.key,
    this.size,
    required this.offset,
  });

  final Offset offset;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Container(
        width: size ?? 120,
        height: size ?? 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.25),
        ),
      ),
    );
  }
}
