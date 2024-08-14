import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/features/posts/domain/post.dart';
import 'package:pet_home/features/tracking/data/provider/tracking_provider.dart';
import 'package:pet_home/features/tracking/domain/event_request.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class EventCreateBottomSheet extends ConsumerStatefulWidget {
  const EventCreateBottomSheet({required this.post, super.key});
  final List<Post> post;
  @override
  ConsumerState<EventCreateBottomSheet> createState() =>
      _EventCreateBottomSheetState();
}

class _EventCreateBottomSheetState
    extends ConsumerState<EventCreateBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  DateTime? selectedTime;
  Post? post;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                InputWithTitle(
                  controller: _titleController,
                  title: 'Titulo',
                  hintText: 'Ingresa el titulo del evento',
                ),
                InputWithTitle(
                  controller: _noteController,
                  title: 'Nota',
                  hintText: 'Ingresa una descripción',
                  isMultiline: true,
                ),
                TextFormField(
                  controller: _timeController,
                  readOnly: true,
                  style: FontConstants.body2,
                  decoration: const InputDecoration(
                    hintText: 'Fecha y hora',
                    hintStyle: TextStyle(color: Palette.textLight),
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () => dateTimePickerWidget(context),
                ),
                const SizedBox(height: 20),
                DropdownSearch<Post>(
                  onChanged: (value) {
                    setState(() {
                      post = value;
                    });
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      TextValidators.textMandatory(value.toString()),
                  items: widget.post,
                  itemAsString: (item) => item.petName,
                  popupProps: PopupProps.menu(
                    itemBuilder: (context, item, isSelected) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(item.petImages.first),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item.petName,
                            style: FontConstants.body2,
                          ),
                        ],
                      ),
                    ),
                    emptyBuilder: (context, searchEntry) => Center(
                      child: Text(
                        'No hay mascotas adoptadas a las cuales hacer seguimiento',
                        style: FontConstants.body2
                            .copyWith(color: Palette.textLight),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelStyle: FontConstants.body2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Mascota de seguimiento',
                      hintStyle: FontConstants.body2
                          .copyWith(color: Palette.textLight),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Palette.errorMedium),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                LargeButton(
                  isEnabled: post != null &&
                      _titleController.text != '' &&
                      _noteController.text != '' &&
                      selectedTime != null,
                  text: 'Guardar evento',
                  onPressed: () => _submitHandler(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      locale: DateTimePickerLocale.es,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime.now(),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          selectedTime = dateTime;
          _timeController.value = TextEditingValue(
            text: DateFormat('EEE, d MMMM hh:mm a', 'es_ES').format(dateTime),
          );
        });
      },
    );
  }

  void _submitHandler() {
    print(
        "DATE: $selectedTime, TITLE: ${_titleController.text}, DESCRIPCION: ${_titleController.text}, POSTID: $post");
    final request = EventRequest(
      eventDate: selectedTime,
      eventTitle: _titleController.text,
      eventNote: _noteController.text,
      post: post,
    );
    ref.read(eventsNotifierProvider.notifier).postEvent(request: request);
  }
}
