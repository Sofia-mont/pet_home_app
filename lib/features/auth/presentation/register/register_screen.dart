import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/auth/presentation/register/register_info_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class Options {
  final String image;
  final String title;
  Options({required this.image, required this.title});
}

List<Options> registerOptions = [
  Options(image: 'assets/img/person.png', title: 'Persona'),
  Options(image: 'assets/img/shelter.png', title: 'Fundación'),
];

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  static const path = '/register';

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  int selectedOption = -1;
  String personType = '';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              'Quiero registrarme como...',
              style: FontConstants.subtitle1.copyWith(color: Palette.primary),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 245,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  onTap: () => setState(() {
                    selectedOption = position;
                    if (position != -1) {
                      personType = position == 1 ? 'Fundación' : 'Persona';
                    }
                  }),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Palette.primary,
                          width: 2,
                        ),
                      ),
                      color:
                          (selectedOption == position) ? Palette.primary : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            registerOptions[position].image,
                            height: 137,
                          ),
                          Text(
                            registerOptions[position].title,
                            style: TextStyle(
                              color: (selectedOption == position)
                                  ? Colors.white
                                  : Palette.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          LargeButton(
            isEnabled: personType != '',
            text: 'Continuar',
            onPressed: () => _onContinue(personType),
          ),
        ],
      ),
    );
  }

  _onContinue(String option) {
    ref.read(appRouterProvider).pushNamed(
      RegisterInfoScreen.path,
      queryParameters: {'userType': option},
    );
  }
}
