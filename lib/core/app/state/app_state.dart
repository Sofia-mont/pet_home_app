import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/logger/custom_logger.dart';

final appStateProvider = Provider((ref) => AppStateImpl(ref: ref));

abstract class AppState {
  AppState(this.ref);

  Future<void> startListeningAppState();
  BuildContext get currentContext;
  ScaffoldMessengerState get scaffoldMessenger;
  final Ref ref;
  final context = GlobalKey<NavigatorState>();
}

class AppStateImpl implements AppState {
  AppStateImpl({required this.ref});

  @override
  final context = GlobalKey<NavigatorState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  final Ref ref;

  DateTime? _inactiveDate;
  @override
  BuildContext get currentContext => context.currentState!.overlay!.context;
  @override
  ScaffoldMessengerState get scaffoldMessenger =>
      scaffoldMessengerKey.currentState!;

  @override
  Future<void> startListeningAppState() async {
    AppLifecycleListener(
      onStateChange: (state) {
        CustomLogger.log('onStateChange: $state');
        switch (state) {
          case AppLifecycleState.inactive:
            _inactiveDate = DateTime.now();
          case AppLifecycleState.resumed:
            if (_inactiveDate != null) {
              handleNotification();
            }
          default:
            break;
        }
      },
    );
  }

  Future<void> handleNotification() async {
    CustomLogger.log('handleNotification');
  }
}
