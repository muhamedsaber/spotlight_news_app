import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlight/core/extensions/theme_extension.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';

class LanguageCard extends StatefulWidget {
  const LanguageCard({super.key});

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isDropdownVisible = !isDropdownVisible;
            });
          },
          child: Card(
            child: ListTile(
              title: const Text("Country"),
              trailing: Icon(
                isDropdownVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          curve: Curves.easeInOut,
          height: isDropdownVisible ? 300.h : 0.0,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: isDropdownVisible
              ? ListView.builder(
                  itemCount: AppConstants.countries.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        updateTheCountryInTheCache(
                            country: AppConstants.countries[index].name);
                        setState(() {
                          isDropdownVisible = false;
                        });
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              height: 30.h,
                              width: 40,
                              child: Image.asset(
                                  AppConstants.countries[index].flag),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              " ${AppConstants.countries[index].name}",
                              style: TextStyle(
                                color: context.theme.colorScheme.onSecondary,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : null,
        ),
      ],
    );
  }

  updateTheCountryInTheCache({required String country}) async {
    await getIt<SharedPreferences>().setString(AppConstants.country, country);
  }
}
