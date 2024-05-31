import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';

class ThemeCard extends StatefulWidget {
  const ThemeCard({super.key});

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    var themeBox = Hive.box(AppConstants.themBox);
    final storedTheme = themeBox.get(AppConstants.isDarkMode) ?? false;
    if (mounted) {
      setState(() {
        darkMode = storedTheme;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Dark Mode"),
        trailing: Switch(
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
            Hive.box(AppConstants.themBox).put(AppConstants.isDarkMode, value);
          },
        ),
      ),
    );
  }
}