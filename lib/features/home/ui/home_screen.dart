import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/features/home/ui/widget/card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  static const path = '/';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var isDialOpen = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                      color: Palette.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/img/pethome_logo.png',
                          height: 50,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Pet Home',
                          style: FontConstants.heading2
                              .copyWith(color: Palette.textLight),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Pethome.home_heart,
                      color: Palette.textMedium,
                    ),
                    title: Text(
                      'Dar en adopción',
                      style: FontConstants.body1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Pethome.dog_nose,
                      color: Palette.textMedium,
                    ),
                    title: Text(
                      'Encuentra tu mascota',
                      style: FontConstants.body1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      indent: 15,
                      endIndent: 15,
                      color: Palette.textMedium,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Pethome.paw_filled,
                      color: Palette.textMedium,
                    ),
                    title: Text(
                      'Mis publicaciones',
                      style: FontConstants.body1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Pethome.heart_filled,
                      color: Palette.textMedium,
                    ),
                    title: Text(
                      'Mis postulaciones',
                      style: FontConstants.body1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              color: Palette.textMedium,
            ),
            ListTile(
              leading: Transform.scale(
                scaleX: -1,
                child: const Icon(
                  Icons.login_rounded,
                  color: Palette.textMedium,
                ),
              ),
              title: const Text(
                'Cerrar sesión',
              ),
              onTap: () => AppService.instance.manageAutoLogout(),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Pethome.dog_nose,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(
              Pethome.paw_filled,
              color: Palette.primary,
            ),
            label: 'Dar en adopción',
            labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
            labelBackgroundColor: Palette.primaryLighter,
          ),
          SpeedDialChild(
            child: const Icon(
              Pethome.dog_nose,
              color: Palette.primary,
            ),
            label: 'Encuentra a tu mascota',
            labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
            labelBackgroundColor: Palette.primaryLighter,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adopciones en Medellín',
                    style: FontConstants.body1.copyWith(color: Palette.primary),
                  ),
                  Text(
                    'Ver más',
                    style: FontConstants.caption2.copyWith(
                      color: Palette.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Palette.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    homeCard(context),
                    homeCard(context),
                    homeCard(context),
                    homeCard(context),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¡Estas macotas buscan un hogar!',
                    style: FontConstants.body1.copyWith(color: Palette.primary),
                  ),
                  Text(
                    'Ver más',
                    style: FontConstants.caption2.copyWith(
                      color: Palette.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Palette.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    homeCard(context),
                    homeCard(context),
                    homeCard(context),
                    homeCard(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
