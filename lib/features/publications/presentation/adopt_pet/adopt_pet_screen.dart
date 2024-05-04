import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class AdoptPetScreen extends ConsumerStatefulWidget {
  const AdoptPetScreen({this.showBottomBar = true, super.key});

  static const path = '/adopt-pet';
  final bool showBottomBar;

  @override
  ConsumerState<AdoptPetScreen> createState() => _AdoptPetFirstScreenState();
}

class _AdoptPetFirstScreenState extends ConsumerState<AdoptPetScreen> {
  String city = '';
  String department = '';
  dynamic allDepartments;

  @override
  initState() {
    allDepartments =
        ref.read(locationNotifierProvider.notifier).getDepartamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String petType = '';
    String petSex = '';
    String isVaccinated = '';
    String isDewormed = '';
    String isNeutered = '';
    String petSize = '';
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationNotifierProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Dar en adopción',
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
            const InputWithTitle(
              title: 'Historia',
              hintText:
                  'Hablanos sobre tu mascota, su historia y su personalidad.',
              isMultiline: true,
            ),
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
            CheckboxSelect(
              title: '¿Perro o gato?',
              options: const ['Perro', 'Gato'],
              groupValue: petType,
              onChanged: (value) {
                setState(() {
                  petType = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title: 'Sexo',
              options: const ['Macho', 'Hembra'],
              groupValue: petSex,
              onChanged: (value) {
                setState(() {
                  petSex = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title: '¿Está vacunado?',
              options: const ['Sí', 'No'],
              groupValue: isVaccinated,
              onChanged: (value) {
                setState(() {
                  isVaccinated = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title: '¿Está desparasitado?',
              options: const ['Sí', 'No'],
              groupValue: isDewormed,
              onChanged: (value) {
                setState(() {
                  isDewormed = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title: '¿Está castrado?',
              options: const ['Sí', 'No'],
              groupValue: isNeutered,
              onChanged: (value) {
                setState(() {
                  isNeutered = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title: 'Tamaño',
              options: const ['Pequeño', 'Mediano', 'Grande'],
              groupValue: petSize,
              onChanged: (value) {
                setState(() {
                  petSize = value ?? '';
                });
              },
            ),
            const SizedBox(height: 20),
            LargeButton(text: 'Publicar', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
