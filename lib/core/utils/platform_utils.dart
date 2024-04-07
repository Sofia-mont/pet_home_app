import 'dart:io';

import 'package:flutter/foundation.dart';

enum PlatformType {
  android,
  ios,
  web,
  windows,
  macos,
  linux,
  unknown;
}

class PlatformUtils {
  PlatformUtils._();

  static final PlatformUtils instance = PlatformUtils._();

  PlatformType? platformType;

  String get platform {
    if (platformType != null) {
      return platformType!.name;
    } else if (isAndroid) {
      platformType = PlatformType.android;
      return platformType!.name;
    } else if (isIOS) {
      platformType = PlatformType.ios;
      return platformType!.name;
    } else if (isWeb) {
      platformType = PlatformType.web;
      return platformType!.name;
    } else if (isWindows) {
      platformType = PlatformType.windows;
      return platformType!.name;
    } else if (isMacOS) {
      platformType = PlatformType.macos;
      return platformType!.name;
    } else if (isLinux) {
      platformType = PlatformType.linux;
      return platformType!.name;
    }
    return platformType!.name;
  }

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isWeb => kIsWeb;
  static bool get isWebMobile => isWeb && (isIOS || isAndroid);
  static bool get isDesktop => isWindows || isMacOS || isLinux;
  static bool get isWindows => Platform.isWindows;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isLinux => Platform.isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isTesting {
    try {
      return Platform.environment.containsKey('FLUTTER_TEST');
    } catch (e) {
      return false;
    }
  }
}
