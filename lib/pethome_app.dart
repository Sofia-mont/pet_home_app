import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/router/router.dart';
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
    ref.read(appStateProvider).startListeningAppState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.read(appStateProvider);
    final routerProv = ref.read(appRouterProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: appState.scaffoldMessengerKey,
      routerConfig: routerProv,
      title: 'Pethome',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
