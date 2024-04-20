import 'package:flutter/material.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';

class AdoptPetSecondScreen extends StatelessWidget {
  const AdoptPetSecondScreen({this.showBottomBar = true, super.key});

  static const path = '/adopt-pet-2';
  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Dar en adopción',
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              Flexible(
                child: CheckboxText(
                  onChange: (value) {},
                  isChecked: true,
                  text: Expanded(child: Text('Perro')),
                ),
              ),
              Flexible(
                child: CheckboxText(
                  onChange: (value) {},
                  isChecked: true,
                  text: Expanded(child: Text('Gato')),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
