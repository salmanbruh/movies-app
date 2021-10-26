import 'package:flutter/material.dart';

enum AppEnvironment {
  DEVELOPMENT,
  PRODUCTION,
}

class AppConfig extends InheritedWidget {
  final AppEnvironment appEnvironment;
  final String appName;
  final String description;
  final String baseUrl;
  final ThemeData themeData;
  final Widget child;

  AppConfig({
    required this.appEnvironment,
    required this.appName,
    required this.description,
    required this.baseUrl,
    required this.themeData,
    required this.child,
    Key? key,
  }) : super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
