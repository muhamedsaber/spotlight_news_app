import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlight/core/injection/dependency_injection.dart';
import 'package:spotlight/core/utils/constants/app_constants.dart';

class CountryUtil {
  Future<String> getCountryNameFromDataBase() async {
    String name =
        getIt<SharedPreferences>().getString(AppConstants.country) ?? "us";
    return name;
  }
}
