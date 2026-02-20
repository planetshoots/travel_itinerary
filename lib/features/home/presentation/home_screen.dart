import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';
import 'package:travel_itinerary_planner/core/widgets/app_side_menu.dart';
import 'package:travel_itinerary_planner/features/profile/presentation/profile_screen.dart';
import 'package:travel_itinerary_planner/core/widgets/app_top_bar.dart';
import 'package:travel_itinerary_planner/core/widgets/image_carousal.dart';
import 'package:travel_itinerary_planner/core/widgets/section_header.dart';
import 'package:travel_itinerary_planner/core/widgets/destination_card.dart';
import 'package:travel_itinerary_planner/core/widgets/app_bottom_nav_bar.dart';
import 'package:travel_itinerary_planner/features/home/domain/models/home_model.dart';
import 'package:travel_itinerary_planner/features/home/domain/models/destination_model.dart';
import 'package:travel_itinerary_planner/features/home/data/home_local_data_source.dart';
import 'package:travel_itinerary_planner/features/home/presentation/wishlist_screen.dart';
import 'package:travel_itinerary_planner/features/map/presentation/map_screen.dart';
import 'package:travel_itinerary_planner/state/wishlist_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  /// ✅ Data source
  final HomeLocalDataSource _dataSource =
      HomeLocalDataSource();

  /// ✅ Model to hold JSON data
  HomeModel? homeData;

  /// ✅ Loading state
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  /// ✅ Load JSON data
  Future<void> _loadHomeData() async {
    final data = await _dataSource.loadHomeData();

    setState(() {
      homeData = data;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppSideMenu(),
      backgroundColor: const Color(0xFFF5F6FA),

      /// 🔹 Reusable Top Bar
      appBar: AppTopBar(
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onSearchTap: () {
          Navigator.pushNamed(context, AppRouter.search);
        },
      ),

      /// 🔹 Show loader until JSON loads
      body: _buildBody(),

      /// 🔹 Bottom Navigation
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
          _currentIndex = index;
          });
        },
      ),
    );
  }
  
  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const WishlistScreen();
      case 2:
        return const MapScreen();
      case 3:
        return const ProfileScreen();
      default:
        return _buildHomeContent();
    }
  } 

  Widget _buildHomeContent() {
    final wishlist = Provider.of<WishlistManager>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            /// 🔹 Top Carousel
            ImageCarousel(
              images: homeData!.topImages
                .map((e) => e.image)
                .toList(),
              ),

            const SizedBox(height: 30),

            /// 🔹 Popular Destination Header
            const SectionHeader(title: "Popular Destinations"),

            const SizedBox(height: 16),

            /// 🔹 Horizontal Scroll Destinations
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeData!.destinations.length,
                itemBuilder: (context, index) {
                  final destination =
                  homeData!.destinations[index];

                  return DestinationCard(
                    destination: destination,
                    onTap: () {},
                    onFavoriteTap: () {
                      wishlist.toggleFavorite(destination);
                    },
                  );
                },
              ),
            ),
            
            const SizedBox(height: 30),

            /// 🔹 Popular Hotel Header
            const SectionHeader(title: "Popular Hotel"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
