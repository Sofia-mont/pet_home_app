import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class DropdownSearchInput extends StatefulWidget {
  const DropdownSearchInput({
    required this.items,
    required this.onChange,
    this.isRequired = false,
    this.title,
    super.key,
  });

  final String? title;
  final ValueChanged<dynamic>? onChange;
  final bool isRequired;
  final List<dynamic> items;

  @override
  State<DropdownSearchInput> createState() => _DropdownSearchInputState();
}

class _DropdownSearchInputState extends State<DropdownSearchInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) ...[
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.title!,
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
        ],
        DropdownSearch(
          key: widget.key,
          onChanged: widget.onChange,
          onSaved: (newValue) {},
          validator: (value) => TextValidators.textMandatory(value),
          items: widget.items,
          itemAsString: (item) => item.toString(),
          popupProps: PopupProps.modalBottomSheet(
            searchFieldProps: const TextFieldProps(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            constraints: const BoxConstraints(maxHeight: 400),
            modalBottomSheetProps: const ModalBottomSheetProps(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
            ),
            itemBuilder: (context, item, isSelected) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                item.toString(),
                style: FontConstants.body2,
              ),
            ),
            showSearchBox: true,
            isFilterOnline: true,
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelStyle: FontConstants.body2,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: 'Selecciona',
              hintStyle:
                  FontConstants.body2.copyWith(color: Palette.textMedium),
            ),
          ),
        ),
      ],
    );
  }
}
