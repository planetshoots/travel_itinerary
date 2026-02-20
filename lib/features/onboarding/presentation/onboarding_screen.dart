import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/features/onboarding/data/onboarding_local_data_source.dart';
import 'package:travel_itinerary_planner/features/onboarding/model/onboarding_model.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final OnboardingLocalDataSource _dataSource =
      OnboardingLocalDataSource();

  List<OnboardingModel> pages = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await _dataSource.loadOnboardingData();
    setState(() {
      pages = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            /// PageView
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        /// Image
                        Image.asset(
                          page.image,
                          height: 250,
                        ),

                        const SizedBox(height: 30),

                        /// Title
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Description
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 12 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Buttons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  /// Skip OR Previous
                  TextButton(
                    onPressed: () {
                      if (currentPage == 0) {
                        _controller.jumpToPage(
                            pages.length - 1);
                      } else {
                        _controller.previousPage(
                          duration: const Duration(
                              milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      currentPage == 0
                          ? "Skip"
                          : "Previous",
                    ),
                  ),

                  /// Next OR Finish
                  TextButton(
                    onPressed: () {
                      if (currentPage ==
                          pages.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const LoginScreen(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(
                              milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      currentPage ==
                              pages.length - 1
                          ? "Finish"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}