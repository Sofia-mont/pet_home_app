import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/app/state/app_state.dart';
import 'package:pet_home/core/utils/platform_utils.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/response_screen.dart';

final customModalsProvider = Provider<CustomModals>(CustomModalsImpl.fromRead);

abstract class CustomModals {
  Future<void> showLoadingDialog([BuildContext? context]);
  Future<void> showAlertDialog({
    bool isError = true,
    String title = '¡Ops! Ha ocurrido un error',
    String message = 'Vuelve a intentarlo',
    VoidCallback? onPressed,
    String buttonMsg = 'Continuar',
    BuildContext context,
  });
  void pop();
}

class CustomModalsImpl implements CustomModals {
  CustomModalsImpl({required this.appState});

  factory CustomModalsImpl.fromRead(Ref ref) {
    return CustomModalsImpl(appState: ref.read(appStateProvider));
  }
  final AppState appState;

  BuildContext get context => appState.currentContext;

  @override
  Future<void> showLoadingDialog([BuildContext? context]) {
    return showAdaptiveDialog(
      context: context ?? this.context,
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
  Future<void> showAlertDialog({
    bool isError = true,
    String title = '¡Ops! Ha ocurrido un error',
    String message = 'Vuelve a intentarlo',
    VoidCallback? onPressed,
    String buttonMsg = 'Continuar',
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
  void pop() {
    GoRouter.of(context).pop();
  }
}
