import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:pet_home/ui/constants/app_theme.dart';

class PethomeApp extends ConsumerStatefulWidget {
  const PethomeApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PethomeAppState();
}

class _PethomeAppState extends ConsumerState<PethomeApp> {
  @override
  void initState() {
    super.initState();
    setPathUrlStrategy();
    AppService.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final routerProv = ref.read(appRouterProvider);
    return MaterialApp.router(
      title: 'Pethome',
      debugShowCheckedModeBanner: false,
      routerDelegate: routerProv.routerDelegate,
      routeInformationParser: routerProv.routeInformationParser,
      routeInformationProvider: routerProv.routeInformationProvider,
      theme: AppTheme.lightTheme(),
    );
  }
}
