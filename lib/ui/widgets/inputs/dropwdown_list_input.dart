import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class DropdownListInput extends StatefulWidget {
  const DropdownListInput({
    this.items = const [],
    this.asyncItems,
    required this.onChange,
    this.title,
    this.hintText = 'Selecciona',
    super.key,
  });

  final String? title;
  final String hintText;
  final List<String> items;
  final ValueChanged<dynamic>? onChange;
  final Future<List<String>> Function(String)? asyncItems;

  @override
  State<DropdownListInput> createState() => _DropdownListInputState();
}

class _DropdownListInputState extends State<DropdownListInput> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: FontConstants.body2,
          ),
        const SizedBox(
          height: 5,
        ),
        DropdownSearch<String>(
          key: widget.key,
          asyncItems: widget.asyncItems,
          onChanged: widget.onChange,
          autoValidateMode: AutovalidateMode.always,
          validator: (value) => TextValidators.textMandatory(value.toString()),
          items: widget.items,
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            menuProps: MenuProps(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            itemBuilder: (context, item, isSelected) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                item.toString(),
                style: FontConstants.body2,
              ),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelStyle: FontConstants.body2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: widget.hintText,
              hintStyle: FontConstants.body2.copyWith(color: Palette.textLight),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
