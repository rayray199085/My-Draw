// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $ticketRoute,
      $drawRoute,
    ];

RouteBase get $ticketRoute => GoRouteData.$route(
      path: '/ticket',
      factory: $TicketRouteExtension._fromState,
    );

extension $TicketRouteExtension on TicketRoute {
  static TicketRoute _fromState(GoRouterState state) => const TicketRoute();

  String get location => GoRouteData.$location(
        '/ticket',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $drawRoute => GoRouteData.$route(
      path: '/draw',
      factory: $DrawRouteExtension._fromState,
    );

extension $DrawRouteExtension on DrawRoute {
  static DrawRoute _fromState(GoRouterState state) => const DrawRoute();

  String get location => GoRouteData.$location(
        '/draw',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
