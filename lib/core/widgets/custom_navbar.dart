import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:spotlight/config/theme/app_colors/app_colors.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.onTabChange});
  final Function(int) onTabChange;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: GNav(
        rippleColor: context.theme.primaryColor,
        hoverColor: context.theme.primaryColor,
        gap: 24,
        backgroundColor: context.theme.colorScheme.surface,
        tabBorder: null,
        haptic: true,
        activeColor: Colors.white,
        iconSize: 24,
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: context.theme.primaryColor,
        color: AppColors.darkNavy,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        tabMargin:
            EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            iconSize: 30,
          ),
          GButton(
            icon: Icons.bookmark,
            text: 'Likes',
            iconSize: 30,
          ),
          GButton(
            icon: Icons.settings,
            text: 'Search',
            iconSize: 30,
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
            widget.onTabChange(index);
          });
        },
      ),
    );
  }
}
