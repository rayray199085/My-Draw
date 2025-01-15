import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_draw/core/router/app_route.dart';
import 'package:my_draw/core/router/router_path.dart';

import 'extra_codec.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: RouterPath.ticketPath,
  navigatorKey: GlobalKey<NavigatorState>(),
  debugLogDiagnostics: true,
  routes: $appRoutes,
  extraCodec: const MyExtraCodec(),
);
