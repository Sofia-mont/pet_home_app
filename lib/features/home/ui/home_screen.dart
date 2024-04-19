import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/home/ui/widget/card.dart';
import 'package:pet_home/features/home/ui/widget/home_drawer.dart';
import 'package:pet_home/features/home/ui/widget/home_speed_dial.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

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
      drawer: const HomeDrawer(),
      floatingActionButton: const HomeSpeedDial(),
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
