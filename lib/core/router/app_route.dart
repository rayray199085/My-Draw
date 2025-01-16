import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_draw/core/router/dialog_pages.dart';
import 'package:my_draw/core/router/router_path.dart';
import 'package:my_draw/features/screens/draw/presentation/draw_screen.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen.dart';

part 'app_route.g.dart';

@TypedGoRoute<TicketRoute>(path: RouterPath.ticketPath)
class TicketRoute extends GoRouteData {
  const TicketRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TicketScreen();
}

@TypedGoRoute<DrawRoute>(path: RouterPath.drawPath)
class DrawRoute extends GoRouteData {
  const DrawRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FullScreenModalPage(
        child: DrawScreen(
      ticketNumbers: state.extra as List<int>,
    ));
  }
}
