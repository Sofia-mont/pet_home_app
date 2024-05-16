import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/domain/form_adoption/candidate_info/candidate_info.dart';
import 'package:pet_home/features/adoption/domain/form_adoption/form_adoption_request/form_adoption_request.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/family_data_screen.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class PersonalDataScreen extends ConsumerStatefulWidget {
  const PersonalDataScreen({required this.postId, super.key});

  final int postId;

  static const path = '/adoption-form-personal-information';

  @override
  ConsumerState<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends ConsumerState<PersonalDataScreen> {
  Key formKey = const Key('adoptKey');
  String city = '';
  String department = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationNotifierProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Column(
        children: [
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos del candidato',
                  style:
                      FontConstants.subtitle2.copyWith(color: Palette.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWithTitle(
                  controller: _nameController,
                  title: 'Nombre completo',
                  hintText: 'Ingresa tu nombre completo',
                ),
                InputWithTitle(
                  controller: _ageController,
                  title: 'Edad',
                  hintText: 'Ingresa tu edad',
                ),
                Row(
                  children: [
                    Flexible(
                      child: DropdownSearchInput(
                        onChange: (value) {
                          setState(() {
                            city = '';
                            department = value;
                          });
                        },
                        asyncItems: (p0) => ref
                            .read(locationNotifierProvider.notifier)
                            .getDepartamentos(),
                        title: 'Departamento',
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
                            selectedItem: city != '' ? city : null,
                            asyncItems: (p0) => ciudades,
                            title: 'Ciudad',
                          ),
                        );
                      },
                    ),
                  ],
                ),
                InputWithTitle(
                  controller: _neighborhoodController,
                  title: 'Barrio',
                  hintText: 'Ingresa el barrio',
                ),
                InputWithTitle(
                  controller: _addressController,
                  title: 'Dirección',
                  hintText: 'Ingresa la dirección completa de tu hogar',
                ),
                InputWithTitle(
                  controller: _phoneController,
                  title: 'Celular',
                  hintText: '312 456 6789',
                  inputType: TextInputType.number,
                ),
                InputWithTitle(
                  controller: _emailController,
                  title: 'Correo electrónico',
                  hintText: 'micorreo@example.com',
                ),
                InputWithTitle(
                  controller: _jobController,
                  title: 'Ocupación',
                  hintText: 'Ingresa tu ocupación',
                ),
              ],
            ),
          ),
          const Spacer(),
          LargeButton(
            text: 'Continuar',
            onPressed: () => _submitHandler(),
          ),
        ],
      ),
    );
  }

  bool _validateForm() {
    return city != '' &&
        department != '' &&
        _nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _neighborhoodController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _jobController.text.isNotEmpty;
  }

  void _submitHandler() {
    FormAdoptionRequest form = FormAdoptionRequest();
    final isValid = _validateForm();
    if (isValid) {
      ref.read(appRouterProvider).push(
            FamilyDataScreen.path,
            extra: FamilyDataScreenArgs(
              form: form.copyWith(
                candidateInfo: CandidateInfo(
                  fullname: _nameController.text,
                  age: _ageController.text,
                  department: department,
                  city: city,
                  neighborhood: _neighborhoodController.text,
                  address: _addressController.text,
                  phoneNumber: _phoneController.text,
                  email: _emailController.text,
                  occupation: _jobController.text,
                ),
              ),
              postId: widget.postId,
            ),
          );
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Información incompleta',
            content: 'Por favor, ingresa toda la información',
            buttonText: 'Aceptar',
          );
    }
  }
}
