import 'package:flutter/material.dart';
import '../../features/home/domain/models/destination_model.dart';

class WishlistItemCard extends StatelessWidget {
  final DestinationModel destination;
  final VoidCallback onRemove;

  const WishlistItemCard({
    super.key,
    required this.destination,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [

          /// 🔹 Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              destination.image,
              height: 70,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          /// 🔹 Title & Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  destination.country,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 Delete Icon
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
