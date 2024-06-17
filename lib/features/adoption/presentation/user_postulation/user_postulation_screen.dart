import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/data/provider/adoption_provider.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_response.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/widgets/tab_postulation_info.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/widgets/tab_postulation_questionnary.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class UserPostulationScreen extends ConsumerStatefulWidget {
  const UserPostulationScreen({
    required this.isPending,
    required this.form,
    super.key,
  });

  static const path = '/postulation';

  final FormAdoptionResponse form;
  final bool isPending;

  @override
  ConsumerState<UserPostulationScreen> createState() =>
      _UserPostulationScreenState();
}

class _UserPostulationScreenState extends ConsumerState<UserPostulationScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TabBar(
              indicator: const BoxDecoration(
                color: Palette.primaryLighter,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              labelStyle:
                  FontConstants.body1.copyWith(color: Palette.primaryDarker),
              unselectedLabelStyle:
                  FontConstants.body2.copyWith(color: Palette.textLight),
              controller: tabController,
              tabs: const [
                Tab(text: 'Datos del candidato'),
                Tab(text: 'Cuestionario'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  TabPostulationInfo(
                    form: widget.form,
                  ),
                  TabPostulationQuestionnary(
                    form: widget.form,
                  ),
                ],
              ),
            ),
            if (widget.isPending)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.read(customModalsProvider).showInfoDialog(
                                title: '¿Estás seguro?',
                                content:
                                    'Si apruebas este formulario, no podrás deshacer esta acción',
                                buttonText: 'Aceptar',
                                buttonAction: () {
                                  ref.read(appRouterProvider).pop();
                                  ref
                                      .read(adoptionNotifierProvider.notifier)
                                      .approveApplication(
                                        formId: widget.form.id,
                                      );
                                },
                              ),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 42),
                      ),
                      child: const Text(
                        'Aprobar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.read(customModalsProvider).showInfoDialog(
                                title: '¿Estás seguro?',
                                content:
                                    'Si rechazas este formulario, no podrás deshacer esta acción',
                                buttonText: 'Aceptar',
                                buttonAction: () {
                                  ref.read(appRouterProvider).pop();
                                  ref
                                      .read(adoptionNotifierProvider.notifier)
                                      .declineApplication(
                                        formId: widget.form.id,
                                      );
                                },
                              ),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 42),
                      ),
                      child: const Text(
                        'Rechazar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
