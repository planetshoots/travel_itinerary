import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewMore;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onViewMore,
          child: Row(
            children: const [
              Text(
                "View more",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
            ],
          ),
        )
      ],
    );
  }
}