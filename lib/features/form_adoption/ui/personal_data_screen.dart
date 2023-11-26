import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopción',
          style:
              FontConstants.subtitle1.copyWith(color: const Color(0xFf70B765)),
        ),
      ),
    );
  }
}
