import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_home/core/utils/pick_image.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/features/posts/domain/post/post/post.dart';
import 'package:pet_home/features/posts/domain/post/post_request.dart/post_request.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class EditPostScreen extends ConsumerStatefulWidget {
  const EditPostScreen({required this.publication, super.key});

  final Post publication;

  static const path = '/edit';

  @override
  ConsumerState<EditPostScreen> createState() => _AdoptPetFirstScreenState();
}

class _AdoptPetFirstScreenState extends ConsumerState<EditPostScreen> {
  final ImageSelector _imageSelector = ImageSelector();
  final formKey = const Key('formPostKey');
  TextEditingController _nameController = TextEditingController();
  TextEditingController _historyController = TextEditingController();
  TextEditingController _ageYearsController = TextEditingController();
  TextEditingController _ageMonthsController = TextEditingController();
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
  void initState() {
    super.initState();
    department = widget.publication.department;
    city = widget.publication.city;
    isVaccinated = widget.publication.vaccinated ? 'Sí' : 'No';
    isDewormed = widget.publication.dewormed ? 'Sí' : 'No';
    isNeutered = widget.publication.neutered ? 'Sí' : 'No';
    petType = widget.publication.petType;
    petSex = widget.publication.petSex;
    petSize = widget.publication.petSize;
    _nameController = TextEditingController(text: widget.publication.petName);
    _historyController =
        TextEditingController(text: widget.publication.petHistory);
    _ageYearsController = TextEditingController(
      text: RegExp(r'(\d+)\s*año')
          .firstMatch(widget.publication.petAge)!
          .group(1),
    );
    _ageMonthsController = TextEditingController(
      text: RegExp(r'(\d+)\s*mes')
          .firstMatch(widget.publication.petAge)
          ?.group(1),
    );
  }

  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationNotifierProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Editar publicación',
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
                          ? '${widget.publication.petImages.length} fotos seleccionadas'
                          : '${selectedImages.length} fotos seleccionadas',
                      style:
                          FontConstants.body1.copyWith(color: Palette.primary),
                    ),
                    const Icon(
                      Icons.add,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: DropdownSearchInput(
                    onChange: (value) {
                      setState(() {
                        department = value;
                        city = '';
                      });
                    },
                    selectedItem: department,
                    asyncItems: (p0) => ref
                        .read(locationNotifierProvider.notifier)
                        .getDepartamentos(),
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
                        selectedItem: city,
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
    return city != widget.publication.city ||
        department != widget.publication.department ||
        petType != widget.publication.petType ||
        petSex != widget.publication.petSex ||
        petSize != widget.publication.petSize ||
        (isDewormed != (widget.publication.dewormed ? 'Sí' : 'No')) ||
        (isNeutered != (widget.publication.neutered ? 'Sí' : 'No')) ||
        (isVaccinated != (widget.publication.vaccinated ? 'Sí' : 'No')) ||
        _nameController.text != widget.publication.petName ||
        _historyController.text != widget.publication.petHistory ||
        _ageYearsController.text !=
            RegExp(r'(\d+)\s*año')
                .firstMatch(widget.publication.petAge)!
                .group(1) ||
        _ageMonthsController.text !=
            RegExp(r'(\d+)\s*mes')
                .firstMatch(widget.publication.petAge)!
                .group(1) ||
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
      ref.read(publicationsNotifierProvider.notifier).editPet(
            request: request,
            postId: widget.publication.id.toString(),
          );
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Información incompleta',
            content: 'Debes modificar por lo menos un campo',
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
