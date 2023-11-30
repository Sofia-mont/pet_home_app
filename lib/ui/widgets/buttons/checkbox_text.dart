import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxText extends StatefulWidget {
  CheckboxText({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.text,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CheckboxText> createState() => _CheckboxTextState();

  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;
  Widget text;
}

class _CheckboxTextState extends State<CheckboxText> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              widget.onChange(isChecked);
            });
          },
          child: AnimatedContainer(
            height: widget.size ?? 25,
            width: widget.size ?? 25,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 3,
                color: widget.borderColor ?? const Color(0xFf70B765),
              ),
            ),
            child: isChecked
                ? Container(
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isChecked
                          ? widget.backgroundColor ?? const Color(0xFf70B765)
                          : Colors.transparent,
                      border: Border.all(
                        width: 3,
                        color: widget.borderColor ?? const Color(0xFf70B765),
                      ),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        widget.text,
      ],
    );
  }
}
