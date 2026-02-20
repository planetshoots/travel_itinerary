import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;
  final String logoPath;
  final String menuIconPath;
  final String searchIconPath;

  const AppTopBar({
    super.key,
    this.logoPath = "assets/icons/logo.png",
    this.menuIconPath = "assets/icons/menu.png",
    this.searchIconPath = "assets/icons/search.png",
    this.onMenuTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 80, // Increased height like Figma
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: const Color(0xFFF5F6FA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Hamburger (Left)
            _CircleIcon(
              iconPath: menuIconPath,
              onTap: onMenuTap,
              iconSize: 40,
            ),

            /// Logo (Center)
            Image.asset(
              logoPath,
              height: 36,
              fit: BoxFit.contain,
            ),

            /// Search (Right)
            _CircleIcon(
              iconPath: searchIconPath,
              onTap: onSearchTap,
              iconSize: 86,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

/// Reusable circular icon used in top bar
class _CircleIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double iconSize;

  const _CircleIcon({
    required this.iconPath,
    this.onTap,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFEDEFF3), // soft grey like Figma
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            height: iconSize,
            width: iconSize,
          ),
        ),
      ),
    );
  }
}
