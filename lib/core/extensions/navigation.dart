import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false,
        arguments: arguments);
  }

  void navigateToAndReplace(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }

  void navigateBackUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}
