import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/posts/presentation/post/post_screen.dart';
import 'package:pet_home/features/tracking/data/provider/tracking_provider.dart';
import 'package:pet_home/features/tracking/domain/event.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class EventInfoBottomSheet extends ConsumerStatefulWidget {
  const EventInfoBottomSheet({required this.event, super.key});
  final Event event;
  @override
  ConsumerState<EventInfoBottomSheet> createState() =>
      _EventCreateBottomSheetState();
}

class _EventCreateBottomSheetState extends ConsumerState<EventInfoBottomSheet> {
  DateTime? selectedTime;
  int? postId;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.eventTitle,
                  style:
                      FontConstants.subtitle1.copyWith(color: Palette.primary),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => ref.read(appRouterProvider).pushNamed(
                          PostScreen.path,
                          extra: widget.event.post,
                          queryParameters: {'isOwner': 'true'},
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Palette.primary,
                              radius: 34.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  widget.event.post!.petImages.first,
                                ),
                                radius: 30.0,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.event.post!.petName,
                              style: FontConstants.body2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('EEE, d MMMM', 'es_ES')
                                  .format(widget.event.eventDate),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              DateFormat('hh:mm a', 'es_ES')
                                  .format(widget.event.eventDate),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.calendar_month),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.event.eventNote,
                  style:
                      FontConstants.body2.copyWith(color: Palette.textMedium),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => ref.read(customModalsProvider).showInfoDialog(
                          title: '¿Estás seguro?',
                          content:
                              'El evento será eliminado de forma permanente y no podrás recuperarlo.',
                          buttonText: 'Eliminar',
                          buttonAction: () {
                            ref.read(appRouterProvider).pop();
                            ref.read(appRouterProvider).pop();
                            ref
                                .read(eventsNotifierProvider.notifier)
                                .deleteEvent(eventId: widget.event.id);
                          },
                        ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Pethome.trash,
                          color: Palette.textMedium,
                        ),
                        Text(
                          'Eliminar evento',
                          style: FontConstants.body2
                              .copyWith(color: Palette.textMedium),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
