import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/auth/presentation/login/login_screen.dart';
import 'package:pet_home/features/home/ui/widget/card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  static const path = '/';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/img/pethome_logo.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await AppService.instance.terminate();
                        if (mounted) {
                          ref.read(appRouterProvider).go(LoginScreen.path);
                        }
                      },
                      child: const Text('Dar en adopción'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Pethome.filter,
                      color: Palette.primary,
                      size: 33,
                    ),
                  ),
                ],
              ),
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
