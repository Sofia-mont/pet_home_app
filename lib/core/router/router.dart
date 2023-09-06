import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/main.dart';

class Routes {
  static final routes = <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ];
}