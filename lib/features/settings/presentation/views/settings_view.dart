import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotlight/core/widgets/appbar_builder.dart';
import 'package:spotlight/features/settings/presentation/widgets/language_card.dart';
import 'package:spotlight/features/settings/presentation/widgets/theme_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarBuilder(title: "Settings", context: context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Column(
            children: [ThemeCard(), LanguageCard()],
          ),
        ));
  }
}
