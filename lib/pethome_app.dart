import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PethomeApp extends ConsumerStatefulWidget {
  const PethomeApp({required this.sharedPreferences, super.key});

  final SharedPreferences sharedPreferences;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PethomeAppState();
}

class _PethomeAppState extends ConsumerState<PethomeApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routerProv = ref.read(appRouterProvider);
    return MaterialApp.router(
      routerConfig: routerProv,
      title: 'Pethome',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
