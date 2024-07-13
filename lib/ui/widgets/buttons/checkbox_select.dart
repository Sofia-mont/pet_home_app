import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

// ignore: must_be_immutable
class CheckboxSelect extends StatefulWidget {
  CheckboxSelect({
    required this.options,
    required this.groupValue,
    this.title,
    this.onChanged,
    super.key,
  });

  final List<String> options;
  String groupValue;
  final String? title;
  final Function(String?)? onChanged;

  @override
  State<CheckboxSelect> createState() => _CheckboxSelectState();
}

class _CheckboxSelectState extends State<CheckboxSelect> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) Text(widget.title!),
          Expanded(
            child: Row(
              children: widget.options
                  .map<Widget>(
                    (option) => Expanded(
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.16,
                            child: Radio<String>(
                              fillColor:
                                  const WidgetStatePropertyAll(Palette.primary),
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                              ),
                              value: option,
                              groupValue: widget.groupValue,
                              onChanged: widget.onChanged,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              option,
                              style: FontConstants.body2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
