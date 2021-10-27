import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/ui/home_page.dart';

class FeatureHomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, arg) => const HomePage(),
        ),
      ];
}
