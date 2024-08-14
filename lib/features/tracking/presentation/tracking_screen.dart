import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/features/posts/domain/post.dart';
import 'package:pet_home/features/tracking/data/provider/tracking_provider.dart';
import 'package:pet_home/features/tracking/domain/event.dart';
import 'package:pet_home/features/tracking/presentation/widgets/event_card.dart';
import 'package:pet_home/features/tracking/presentation/widgets/event_create_bottom_sheet.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class TrackingScreen extends ConsumerStatefulWidget {
  const TrackingScreen({super.key});

  static const path = '/tracking';

  @override
  ConsumerState<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends ConsumerState<TrackingScreen> {
  final scrollController = ScrollController();
  Set<Post> post = {};

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES');
  }

  @override
  Widget build(BuildContext context) {
    final event = ref.watch(fetchEventsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seguimiento',
          style: TextStyle(color: Palette.primary),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: PaginatedListView(
                state: event,
                itemBuilder: (_, data) {
                  return EventCard(
                    event: data,
                  );
                },
                listViewBuilder: (context, data) {
                  final groupedData = <String, List<Event>>{};
                  for (var event in data) {
                    if (event.post?.postState != 'NO ADOPTADO') {
                      post.add(event.post!);
                    }
                    final formattedDate = DateFormat('yyyy-MM-dd', 'es_ES')
                        .format(event.eventDate);
                    if (groupedData.containsKey(formattedDate)) {
                      groupedData[formattedDate]!.add(event);
                    } else {
                      groupedData[formattedDate] = [event];
                    }
                  }
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        'No tienes ninguna actividad de seguimiento por el momento.',
                        style: FontConstants.body2
                            .copyWith(color: Palette.textMedium),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groupedData.entries.map<Widget>((entry) {
                      final date = entry.key;
                      final events = entry.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              DateFormat('EEE, d MMMM', 'es_ES')
                                  .format(DateTime.parse(date)),
                              style: FontConstants.body1
                                  .copyWith(color: Palette.textMedium),
                            ),
                          ),
                          // Lista de EventCard bajo la misma fecha
                          ...events.map(
                            (event) => EventCard(
                              event: event,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
                notifier: ref.read((fetchEventsProvider.notifier)),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return EventCreateBottomSheet(
                    post: post.toList(),
                  );
                },
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Palette.primary,
                    ),
                    Text(
                      'Crear evento',
                      style: FontConstants.subtitle2
                          .copyWith(color: Palette.primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
