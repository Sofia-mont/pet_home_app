import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/widgets/tab_postulation_info.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/widgets/tab_postulation_questionnary.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class UserPostulationScreen extends ConsumerStatefulWidget {
  const UserPostulationScreen({super.key});

  static const path = '/postulation';

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
                children: const [
                  TabPostulationInfo(),
                  TabPostulationQuestionnary(),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 42),
                    ),
                    child: Text(
                      'Aprobar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 42),
                    ),
                    child: Text(
                      'Rechazar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
