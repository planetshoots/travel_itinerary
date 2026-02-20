import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 Back + Search Field
              Row(
                children: [

                  /// Back Button
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Search Field UI
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            "Search destinations",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// 🔹 Title
              const Text(
                "Search Near me",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Hotel
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF6CA8F1).withOpacity(0.15),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/hotel.png",
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Hotel", style: TextStyle(fontSize: 13)),
                    ],
                  ),

                  /// Restaurants
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF5BC17F).withOpacity(0.15),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/restaurant.png",
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Restaurants", style: TextStyle(fontSize: 13)),
                    ],
                  ),

                  /// Hospital
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF4B64F).withOpacity(0.15),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/hospital.png",
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Hospital", style: TextStyle(fontSize: 13)),
                    ],
                  ),

                  /// Fun Place
                  Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF54C5CF).withOpacity(0.15),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/fun.png",
                            height: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Fun Place", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
    );
  }
}
