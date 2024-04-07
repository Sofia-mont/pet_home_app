import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class ResponseScreenArgs extends Equatable {
  const ResponseScreenArgs({
    required this.isError,
    required this.title,
    required this.buttonMsg,
    required this.message,
    this.onPressed,
  });
  final bool isError;
  final String title;
  final String message;
  final VoidCallback? onPressed;
  final String buttonMsg;

  @override
  List<Object?> get props => [isError, title, buttonMsg, message, onPressed];
}

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({
    required this.isError,
    required this.title,
    required this.buttonMsg,
    required this.message,
    this.onPressed,
    super.key,
  });

  final bool isError;
  final String title;
  final String message;
  final VoidCallback? onPressed;
  final String buttonMsg;

  static const path = '/response-screen';

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        if (widget.onPressed != null) widget.onPressed?.call();
      },
      child: CustomScaffold(
        withAppbar: false,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/animations/response_screen_animation.gif',
                    height: 200,
                  ),
                  Text(
                    widget.title,
                    style: FontConstants.subtitle1.copyWith(
                      color: widget.isError
                          ? Palette.errorDark
                          : Palette.primary00,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.message),
                ],
              ),
            ),
            LargeButton(text: widget.buttonMsg, onPressed: onNextButton),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void onNextButton() {
    if (widget.onPressed != null) {
      widget.onPressed?.call();
      return;
    }
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
  }
}
