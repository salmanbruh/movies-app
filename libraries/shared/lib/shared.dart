import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/utils/named_routes.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => NamedRoutes()),
      ];

  @override
  List<ModularRoute> get routes => [];
}
