import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(
        builder: (context) =>const Scaffold(
          body: Center(
            child: Text("No Routes Found on this Name!"),
          ),
        ),
      );
  }
}
