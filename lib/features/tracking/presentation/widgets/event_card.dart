import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/features/tracking/domain/event.dart';
import 'package:pet_home/features/tracking/presentation/widgets/event_info_bottom_sheet.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class EventCard extends StatefulWidget {
  const EventCard({required this.event, super.key});

  final Event event;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return EventInfoBottomSheet(event: widget.event);
        },
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.event.eventTitle,
              style: FontConstants.body1.copyWith(color: Palette.textLighter),
            ),
            Text(
              DateFormat('hh:mm a', 'es_ES').format(widget.event.eventDate),
              style: FontConstants.body2.copyWith(color: Palette.textLighter),
            ),
          ],
        ),
      ),
    );
  }
}
