import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
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

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quiero registrarme como...',
            style: TextStyle(
              color: Palette.primary00,
              fontSize: 20,
              fontWeight: FontWeight.w700,
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
                  }),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Palette.primary00,
                          width: 2,
                        ),
                      ),
                      color: (selectedOption == position)
                          ? Palette.primary00
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  : Palette.primary00,
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
            text: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).push(RoutePath.registerInfo.path),
          ),
        ],
      ),
    );
  }
}