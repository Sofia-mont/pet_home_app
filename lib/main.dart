import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_home/core/app/domain/user_data.dart';
import 'package:pet_home/pethome_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox('App Service Box');
  runApp(
    const ProviderScope(
      child: PethomeApp(),
    ),
  );
}
