import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';
import '../../features/home/domain/models/destination_model.dart';
import 'package:travel_itinerary_planner/state/wishlist_manager.dart';
import 'package:provider/provider.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const DestinationCard({
    super.key,
    required this.destination,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistManager>(context);
    final isFav = wishlist.isFavorite(destination);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.destinationDetails,
          arguments: destination,
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    destination.image,
                    height: 140,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Favorite button
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: onFavoriteTap,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),

            Text(
              destination.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(
              destination.country,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}