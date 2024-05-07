import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_home/core/utils/pick_image.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/features/publications/data/provider/publications_provider.dart';
import 'package:pet_home/features/publications/domain/post/post_request.dart/post_request.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class AdoptPetScreen extends ConsumerStatefulWidget {
  const AdoptPetScreen({this.showBottomBar = true, super.key});

  static const path = '/adopt-pet';
  final bool showBottomBar;

  @override
  ConsumerState<AdoptPetScreen> createState() => _AdoptPetFirstScreenState();
}

class _AdoptPetFirstScreenState extends ConsumerState<AdoptPetScreen> {
  final ImageSelector _imageSelector = ImageSelector();
  final formKey = const Key('formPostKey');
  dynamic allDepartments;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _historyController = TextEditingController();
  final TextEditingController _ageYearsController = TextEditingController();
  final TextEditingController _ageMonthsController = TextEditingController();
  List<XFile> selectedImages = [];
  String city = '';
  String department = '';
  String petType = '';
  String petSex = '';
  String isVaccinated = '';
  String isDewormed = '';
  String isNeutered = '';
  String petSize = '';

  @override
  initState() {
    allDepartments =
        ref.read(locationNotifierProvider.notifier).getDepartamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationNotifierProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Dar en adopción',
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final tempFile = await _imageSelector.selectImagesFromGallery();
                setState(() {
                  selectedImages = tempFile;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Palette.textMedium.withOpacity(0.25),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedImages.isEmpty
                          ? 'Agrega fotos de la mascota'
                          : '${selectedImages.length} fotos seleccionadas',
                      style:
                          FontConstants.body1.copyWith(color: Palette.primary),
                    ),
                    Icon(
                      selectedImages.isEmpty ? Icons.add : Icons.edit,
                      color: Palette.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InputWithTitle(
              title: 'Nombre',
              hintText: 'Nombre de la mascota',
              controller: _nameController,
            ),
            InputWithTitle(
              title: 'Historia',
              hintText:
                  'Hablanos sobre tu mascota, su historia y su personalidad.',
              isMultiline: true,
              controller: _historyController,
            ),
            Row(
              children: [
                Flexible(
                  child: InputWithTitle(
                    title: 'Edad',
                    hintText: 'Años',
                    inputType: TextInputType.number,
                    controller: _ageYearsController,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: InputWithTitle(
                    title: '',
                    hintText: 'Meses',
                    inputType: TextInputType.number,
                    controller: _ageMonthsController,
                  ),
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
            LargeButton(text: 'Publicar', onPressed: () => _submitHandler()),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    return city != '' &&
        department != '' &&
        petType != '' &&
        petSex != '' &&
        petSize != '' &&
        isDewormed != '' &&
        isNeutered != '' &&
        isVaccinated != '' &&
        _nameController.text.isNotEmpty &&
        _historyController.text.isNotEmpty &&
        (_ageYearsController.text != '' || _ageMonthsController.text != '') &&
        selectedImages.isNotEmpty;
  }

  void _submitHandler() {
    final isValid = _validateForm();
    if (isValid) {
      final request = PostRequest(
        department: department,
        city: city,
        petName: _nameController.text,
        petHistory: _historyController.text,
        petType: petType,
        petSex: petSex,
        petAge: getPetAge(_ageMonthsController.text, _ageYearsController.text),
        petSize: petSize,
        vaccinated: isVaccinated == 'Sí' ? true : false,
        dewormed: isDewormed == 'Sí' ? true : false,
        neutered: isNeutered == 'Sí' ? true : false,
        images: selectedImages,
      );
      ref
          .read(publicationsNotifierProvider.notifier)
          .postPet(context: context, request: request);
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Información incompleta',
            content: 'Por favor, ingresa toda la información',
            buttonText: 'Aceptar',
          );
    }
  }

  String getPetAge(String months, String years) {
    String yearsString = years == '' ? '' : '$years años';
    String monthsString = months == '' ? '' : '$months meses';
    String connection = (yearsString == '' && monthsString != '') ||
            (yearsString != '' && monthsString == '')
        ? ''
        : ' y ';
    return '$yearsString$connection$monthsString';
  }
}
