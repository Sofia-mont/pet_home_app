import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/features/publications/ui/adopt_pet/adopt_pet_second_screen.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class AdoptPetFirstScreen extends ConsumerStatefulWidget {
  const AdoptPetFirstScreen({this.showBottomBar = true, super.key});

  static const path = '/adopt-pet';
  final bool showBottomBar;

  @override
  ConsumerState<AdoptPetFirstScreen> createState() =>
      _AdoptPetFirstScreenState();
}

class _AdoptPetFirstScreenState extends ConsumerState<AdoptPetFirstScreen> {
  String city = '';
  String department = '';
  dynamic allDepartments;

  @override
  initState() {
    allDepartments = ref.read(locationProvider.notifier).getDepartamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Dar en adopción',
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Column(
                children: [
                  Text('Foto'),
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Palette.textLighter,
                    child: Icon(
                      Icons.add,
                      color: Palette.primary,
                    ),
                  ),
                ],
              ),
            ),
            const InputWithTitle(
              title: 'Nombre',
              hintText: 'Nombre de la mascota',
            ),
            const SizedBox(height: 30),
            const InputWithTitle(
              title: 'Historia',
              hintText:
                  'Hablanos sobre tu mascota, su historia y su personalidad.',
              isMultiline: true,
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Flexible(
                  child: InputWithTitle(title: 'Edad', hintText: 'Años'),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: InputWithTitle(title: '', hintText: 'Meses'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Flexible(
                  child: DropdownSearchInput(
                    onChange: (value) {
                      setState(() {
                        department = value;
                      });
                    },
                    asyncItems: (p0) => allDepartments,
                    title: 'Ubicación',
                    hintText: 'Departamento',
                  ),
                ),
                const SizedBox(width: 20),
                FutureBuilder(
                  future: ciudades,
                  builder: (context, snapshot) {
                    return Flexible(
                      child: DropdownSearchInput(
                        onChange: (value) {
                          setState(() {
                            city = value;
                          });
                        },
                        asyncItems: (p0) => ciudades,
                        title: '',
                        hintText: 'Ciudad',
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            LargeButton(
              text: 'Continuar',
              onPressed: () => ref
                  .read(appRouterProvider)
                  .pushNamed(AdoptPetSecondScreen.path),
            ),
          ],
        ),
      ),
    );
  }
}
