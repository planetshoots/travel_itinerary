import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_itinerary_planner/core/widgets/wishlist_item_card.dart';
import 'package:travel_itinerary_planner/state/wishlist_manager.dart';
import '../../../core/widgets/destination_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistManager>(context);

    if (wishlist.favorites.isEmpty) {
      return const _EmptyWishlist();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: wishlist.favorites.length,
        itemBuilder: (context, index) {
          final item = wishlist.favorites[index];

          return WishlistItemCard(
            destination: item,
            onRemove: () {
              wishlist.toggleFavorite(item); // All listening widgets rebuild
            },
          );
        },
      ),
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  const _EmptyWishlist();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🔹 Circle background with heart
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 50,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 24),

            /// 🔹 Title
            const Text(
              "Empty",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            /// 🔹 Subtitle
            const Text(
              "Start Building your travel Wishlist by saving\ninspiring destinations and Experiences",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

