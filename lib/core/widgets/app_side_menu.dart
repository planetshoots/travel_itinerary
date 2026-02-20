import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [

            /// Close button (Top Right)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 10),

            /// Profile Section
            Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Melissa Peters",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "melpeters@gmail.com",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// Menu Items
            _MenuItem(icon: Icons.list_alt, title: "List of Trip places"),
            _MenuItem(icon: Icons.support_agent, title: "Customer Support"),
            _MenuItem(icon: Icons.lock, title: "Privacy and Policy"),
            _MenuItem(icon: Icons.description, title: "Terms and Conditions"),
            _MenuItem(icon: Icons.settings, title: "Setting"),

            const Spacer(),

            /// Logout Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    title: const Text("Logout"),
                    content: const Text(
                      "Are you sure you want to logout?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F80ED),
                          foregroundColor: Colors.white,
                        ),
                      child: const Text("Yes"),
                      ),
                    ],
                    );
                  },
                );

                if (shouldLogout == true) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.login,
                    (route) => false,
                  );
                }
              },
                  style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFF2F80ED),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable Menu Item
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {},
    );
  }
}
