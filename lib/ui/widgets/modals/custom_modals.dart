import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/utils/platform_utils.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropwdown_list_input.dart';
import 'package:pet_home/ui/widgets/response_screen.dart';

final customModalsProvider = Provider<CustomModals>(CustomModalsImpl.fromRead);

abstract class CustomModals {
  Future<void> showLoadingDialog();
  Future<void> showInformativeScreen({
    bool isError = true,
    String title = '¡Ops! Ha ocurrido un error',
    String message = 'Vuelve a intentarlo',
    VoidCallback? onPressed,
    String buttonMsg = 'Reintentar',
  });
  Future<void> showInfoDialog({
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? buttonAction,
  });
  Future<void> showFilterDialog();
  void pop();
}

class CustomModalsImpl implements CustomModals {
  CustomModalsImpl({required this.appState});

  factory CustomModalsImpl.fromRead(Ref ref) {
    return CustomModalsImpl(appState: AppService.instance);
  }

  final AppService appState;

  BuildContext get context => appState.context;

  @override
  Future<void> showLoadingDialog() {
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
  }) async {
    GoRouter.of(context).goNamed(
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

  @override
  Future<void> showInfoDialog({
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? buttonAction,
  }) {
    return showAdaptiveDialog(
      context: context,
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
            onPressed: buttonAction ?? () => Navigator.pop(context),
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

  @override
  Future<void> showFilterDialog() {
    return showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        iconPadding: const EdgeInsets.all(10),
        icon: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Palette.primary,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Filtrar',
          style: FontConstants.subtitle2.copyWith(
            color: Palette.primary,
          ),
          textAlign: TextAlign.start,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownListInput(
              onChange: (value) {},
              title: 'Tipo de mascota',
              items: const ['Perro', 'Gato'],
            ),
            DropdownListInput(
              onChange: (value) {},
              title: 'Tamaño',
              items: const ['Pequeño', 'Mediano', 'Grande'],
            ),
            DropdownListInput(
              onChange: (value) {},
              title: 'Sexo',
              items: const ['Macho', 'Hembra'],
            ),
          ],
        ),
        actions: [
          LargeButton(
            onPressed: () {},
            text: 'Aplicar filtros',
          ),
        ],
      ),
    );
  }
}
