import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final String temperature;
  const TemperatureText({
    super.key,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(
          temperature,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        const Positioned(
          top: -6,
          right: -16,
          child: Text(
            "°",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }
}
