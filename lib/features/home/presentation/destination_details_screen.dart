import 'package:flutter/material.dart';
import '../domain/models/destination_model.dart';
import 'package:provider/provider.dart';
import 'package:travel_itinerary_planner/state/wishlist_manager.dart';
import 'package:share_plus/share_plus.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final DestinationModel destination;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistManager>(context); // access the global state
    final isFav = wishlist.isFavorite(destination);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Top Image section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30)),
                  child: Image.asset(
                    destination.image,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Back button
                Positioned(
                  top: 50,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

              /// Share
                Positioned(
                  top: 50,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                          Share.share(
                            "Check out this amazing destination: ${destination.title} - ${destination.description}",
                            subject: destination.title,
                          );
                      },
                    ),
                  ),
                ),

                /// Heart
                Positioned(
                  top: 50,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        wishlist.toggleFavorite(destination);
                      },
                    ),
                  ),
                ),
                
                /// Title
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    destination.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          
          const SizedBox(height: 20),

          /// 🔹 Google Ads Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/images/google_ads.png",
                height: 80,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Rating
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        destination.rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Text("(${destination.reviews})"),
                      const SizedBox(width: 16),
                      Text(destination.architecture),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    destination.description,
                    style: const TextStyle(
                        height: 1.6,
                        color: Colors.black87),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Address : ${destination.address}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
