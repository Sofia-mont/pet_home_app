import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class InputWithTitle extends StatefulWidget {
  const InputWithTitle({
    this.isRequired = false,
    this.obscureText = false,
    required this.title,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.isMultiline = false,
    required this.hintText,
    super.key,
  });

  final String title;
  final String hintText;
  final bool isRequired;
  final bool obscureText;
  final bool isMultiline;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;

  @override
  State<InputWithTitle> createState() => _InputWithTitleState();
}

class _InputWithTitleState extends State<InputWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                widget.title,
                style: FontConstants.body2,
              ),
            ),
            if (widget.isRequired)
              Text(
                ' *',
                style:
                    FontConstants.caption2.copyWith(color: Palette.errorDark),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: (value) => setState(() {}),
          keyboardType:
              widget.isMultiline ? TextInputType.multiline : widget.inputType,
          minLines: widget.isMultiline ? 3 : 1,
          maxLines: widget.isMultiline ? 10 : 1,
          validator: widget.validator,
          style: FontConstants.body2,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Palette.textMedium),
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }
}
