import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color? color;
  const Tag({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
