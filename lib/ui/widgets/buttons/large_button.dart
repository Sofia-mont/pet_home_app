import 'package:flutter/material.dart';

class LargeButton extends StatefulWidget {
  const LargeButton({
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    super.key,
  });

  final Function() onPressed;
  final String text;
  final bool isEnabled;

  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 42),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
