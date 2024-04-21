import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class DropdownSearchInput extends StatefulWidget {
  const DropdownSearchInput({
    this.items = const [],
    this.asyncItems,
    required this.onChange,
    this.isRequired = false,
    this.title,
    this.hintText = 'Selecciona',
    super.key,
  });

  final String? title;
  final String hintText;
  final ValueChanged<dynamic>? onChange;
  final bool isRequired;
  final List<Object?> items;
  final Future<List<Object?>> Function(String)? asyncItems;

  @override
  State<DropdownSearchInput> createState() => _DropdownSearchInputState();
}

class _DropdownSearchInputState extends State<DropdownSearchInput> {
  @override
  initState() {
    super.initState();
  }

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
        Row(
          children: [
            Expanded(
              child: DropdownSearch(
                asyncItems: widget.asyncItems,
                key: widget.key,
                onChanged: widget.onChange,
                onSaved: (newValue) {},
                autoValidateMode: AutovalidateMode.always,
                validator: (value) =>
                    TextValidators.textMandatory(value.toString()),
                items: widget.items,
                itemAsString: (item) => item.toString(),
                popupProps: PopupProps.dialog(
                  isFilterOnline: true,
                  showSearchBox: true,
                  title: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    child: Text(
                      widget.title != null
                          ? 'Seleccionar ${widget.title!.toLowerCase()}'
                          : '',
                      style: FontConstants.subtitle2
                          .copyWith(color: Palette.primary),
                    ),
                  ),
                  searchFieldProps: TextFieldProps(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    style: FontConstants.body2,
                    decoration: const InputDecoration(
                      hintText: 'Buscar',
                      hintStyle: TextStyle(color: Palette.textLight),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
                  emptyBuilder: (context, searchEntry) => Center(
                    child: Text(
                      'No hay información',
                      style:
                          FontConstants.body2.copyWith(color: Palette.primary),
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
                    hintStyle:
                        FontConstants.body2.copyWith(color: Palette.textLight),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
