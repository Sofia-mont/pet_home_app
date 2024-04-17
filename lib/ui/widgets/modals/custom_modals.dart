import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/utils/platform_utils.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/response_screen.dart';

final customModalsProvider = Provider<CustomModals>(CustomModalsImpl.fromRead);

abstract class CustomModals {
  Future<void> showLoadingDialog(BuildContext context);
  Future<void> showInformativeScreen({
    bool isError = true,
    String title = '¡Ops! Ha ocurrido un error',
    String message = 'Vuelve a intentarlo',
    VoidCallback? onPressed,
    String buttonMsg = 'Reintentar',
    BuildContext context,
  });
  Future<void> showInfoDialog({
    required BuildContext buildContext,
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? buttonAction,
  });
  void pop(BuildContext context);
}

class CustomModalsImpl implements CustomModals {
  CustomModalsImpl();

  factory CustomModalsImpl.fromRead(Ref ref) {
    return CustomModalsImpl();
  }

  @override
  Future<void> showLoadingDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: AlertDialog.adaptive(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Palette.textMedium,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (PlatformUtils.isIOS)
                Text(
                  'Cargando...',
                  style: FontConstants.body2,
                ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Future<void> showInformativeScreen({
    bool isError = true,
    String title = '¡Ops! Ha ocurrido un error',
    String message = 'Vuelve a intentarlo',
    VoidCallback? onPressed,
    String buttonMsg = 'Reintentar',
    BuildContext? context,
  }) {
    return GoRouter.of(context!).pushNamed<void>(
      ResponseScreen.path,
      extra: ResponseScreenArgs(
        isError: isError,
        title: title,
        message: message,
        onPressed: onPressed,
        buttonMsg: buttonMsg,
      ),
    );
  }

  @override
  void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }

  @override
  Future<void> showInfoDialog({
    required BuildContext buildContext,
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? buttonAction,
  }) {
    return showAdaptiveDialog(
      context: buildContext,
      builder: (context) => AlertDialog.adaptive(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          title,
          style: FontConstants.subtitle2.copyWith(
            color: Palette.primary,
          ),
        ),
        content: Text(
          content,
          style: FontConstants.body2.copyWith(
            color: Palette.textMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: buttonAction,
            child: Text(
              buttonText,
              style: FontConstants.body2.copyWith(
                color: Palette.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
