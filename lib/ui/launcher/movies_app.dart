import 'package:core/network/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_app/ui/splash/splash_page.dart';
import 'package:shared/common/common.dart';

class AppModule extends Module {
  final String baseUrl;

  AppModule({required this.baseUrl});

  @override
  List<Bind> get binds => [
        Bind((_) => ColorPalettes()),
        Bind((_) => NamedRoutes()),
        Bind((_) => DioClient(apiBaseUrl: baseUrl)),
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
      theme: theme,
      debugShowCheckedModeBanner:
          AppConfig.of(context).appEnvironment == AppEnvironment.development
              ? true
              : false,
    ).modular();
  }
}
