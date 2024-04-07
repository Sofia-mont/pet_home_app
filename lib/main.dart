import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/app/provider/app_provider_observer.dart';
import 'package:pet_home/pethome_app.dart';
import 'package:equatable/equatable.dart';

Future<void> main() async {
  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      GoRouter.optionURLReflectsImperativeAPIs = true;
      EquatableConfig.stringify = true;
      runApp(
        ProviderScope(
          observers: [AppProviderObserver()],
          child: const PethomeApp(),
        ),
      );
    },
    (e, s) {},
  );
}
