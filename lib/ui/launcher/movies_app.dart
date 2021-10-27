import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:movies_app/ui/splash/splash_page.dart';
import 'package:shared/common/common.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => NamedRoutes()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().splashPage,
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(
          Modular.get<NamedRoutes>().homePage,
          module: FeatureHomeModule(),
        ),
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Material(
          child: child,
        );
      },
      title: "Movies App",
      initialRoute: Modular.get<NamedRoutes>().splashPage,
    ).modular();
  }
}
