import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/features/posts/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:pet_home/features/posts/presentation/post/filtered_post_screen.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/dropwdown_list_input.dart';

class FilterPetScreen extends ConsumerStatefulWidget {
  const FilterPetScreen({super.key});

  static const path = '/filter';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterPetScreenState();
}

class _FilterPetScreenState extends ConsumerState<FilterPetScreen> {
  String petType = '';
  String petSize = '';
  String petSex = '';
  String city = '';
  String department = '';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Filtrar',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownListInput(
            onChange: (value) => setState(() => petType = value),
            title: 'Tipo de mascota',
            items: const ['Perro', 'Gato'],
          ),
          DropdownListInput(
            onChange: (value) => setState(() => petSize = value),
            title: 'Tamaño',
            items: const ['Pequeño', 'Mediano', 'Grande'],
          ),
          DropdownListInput(
            onChange: (value) => setState(() => petSex = value),
            title: 'Sexo',
            items: const ['Macho', 'Hembra'],
          ),
          DropdownSearchInput(
            onChange: (value) {
              setState(() {
                city = '';
                department = value;
              });
            },
            asyncItems: (p0) =>
                ref.read(locationNotifierProvider.notifier).getDepartamentos(),
            title: 'Departamento',
          ),
          Flexible(
            child: DropdownSearchInput(
              onChange: (value) => setState(() => city = value),
              asyncItems: (p0) => department == ''
                  ? Future.value([])
                  : ref
                      .read(locationNotifierProvider.notifier)
                      .getCiudades(department),
              title: 'Ciudad',
              selectedItem: city != '' ? city : null,
            ),
          ),
          const Spacer(),
          LargeButton(
            isEnabled: petType != '' ||
                petSex != '' ||
                petSize != '' ||
                city != '' ||
                department != '',
            onPressed: () {
              ref.read(appRouterProvider).pushReplacement(
                    FilteredPostsScreen.path,
                    extra: PublicationsResponseQuery(
                      petType: petType,
                      petSex: petSex,
                      petSize: petSize,
                      city: city,
                      department: department,
                    ),
                  );
            },
            text: 'Aplicar filtros',
          ),
        ],
      ),
    );
  }
}
