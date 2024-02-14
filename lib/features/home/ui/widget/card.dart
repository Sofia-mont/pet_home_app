import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';

Container homeCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      image: DecorationImage(
        image: NetworkImage(
          'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg',
        ),
        fit: BoxFit.cover,
      ),
    ),
    height: MediaQuery.of(context).size.height / 3.5,
    width: MediaQuery.of(context).size.width / 1.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(color: Palette.textLight),
          width: MediaQuery.of(context).size.width / 1.2,
          padding: const EdgeInsets.all(10),
          child: const Row(
            children: [
              Icon(Pethome.female),
              SizedBox(
                width: 5,
              ),
              Text('Firulais'),
            ],
          ),
        ),
      ],
    ),
  );
}
