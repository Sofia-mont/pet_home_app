import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/personal_data_screen.dart';
import 'package:pet_home/features/posts/domain/post/post/post.dart';
import 'package:pet_home/features/posts/presentation/post/widgets/own_post_dial.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({
    required this.publication,
    this.isOwner = false,
    super.key,
  });

  @override
  ConsumerState<PostScreen> createState() => _PublicationScreenState();

  static const path = '/publication';

  final bool isOwner;
  final Post publication;
}

class _PublicationScreenState extends ConsumerState<PostScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES');
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: widget.isOwner ? const OwnPostDial() : null,
      withAppbar: false,
      withPadding: false,
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'pet',
                      child: Image.network(widget.publication.petImages[0]),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.publication.postOwner.name,
                                  style: FontConstants.body1
                                      .copyWith(color: Palette.primaryDarker),
                                ),
                                Text(
                                  'Dueño',
                                  style: FontConstants.caption2
                                      .copyWith(color: Palette.textMedium),
                                ),
                              ],
                            ),
                            Text(
                              'Publicado en \n${DateFormat('MMM d, yyyy', 'es_ES').format(widget.publication.createdAt)}',
                              style: FontConstants.caption2
                                  .copyWith(color: Palette.textMedium),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children: [
                              Text(
                                widget.publication.petHistory,
                                textAlign: TextAlign.justify,
                                style: FontConstants.body2
                                    .copyWith(color: Palette.textMedium),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: LargeButton(
                            onPressed: () => ref
                                .read(customModalsProvider)
                                .showInfoDialog(
                                  buildContext: context,
                                  title: 'Mensaje para el posible adoptante',
                                  content:
                                      'Si decides que quieres en tu vida la compañía de una vida animal, debes ser consciente del compromiso que esto implica. La vida está llena de cambios y en los 15 años que vive en promedio un perro o un gato se van a presentar una infinidad de situaciones que deberás enfrentar de manera seria y responsable. \n Si decides adoptar un animal debes acogerlo como un miembro más de tu casa. Esto quiere decir que, pase lo que pase, el animal siempre será tenido en cuenta en las decisiones de la familia y por ningún motivo se desharán de él, como si fuera un objeto o un juguete. Ningún problema es excusa para abandonarlo, del mismo modo que no es excusa para abandonar a cualquier otro integrante de tu familia',
                                  buttonText: 'Aceptar',
                                  buttonAction: () {
                                    ref.read(appRouterProvider).pop();
                                    ref
                                        .read(appRouterProvider)
                                        .pushNamed(PersonalDataScreen.path);
                                  },
                                ),
                            text: 'Adoptame',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(appRouterProvider).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 150,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Palette.textLighter,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Pethome.map_pin,
                            color: Palette.textMedium,
                            size: 20,
                          ),
                          Text(
                            '${widget.publication.department}, ${widget.publication.city}',
                            style: FontConstants.body2
                                .copyWith(color: Palette.textMedium),
                          ),
                        ],
                      ),
                      Icon(
                        widget.publication.petSex == 'Macho'
                            ? Pethome.male
                            : Pethome.female,
                        color: widget.publication.petSex == 'Macho'
                            ? Palette.primary
                            : Palette.softPink,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.publication.petName,
                        style: FontConstants.heading3
                            .copyWith(color: Palette.primaryDarker),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(
                              widget.publication.petSize == 'Grande' ? 1 : 0.3,
                            ),
                            size: 35,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(
                              widget.publication.petSize == 'Mediano' ? 1 : 0.3,
                            ),
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(
                              widget.publication.petSize == 'Pequeño' ? 1 : 0.3,
                            ),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.publication.petAge,
                    style:
                        FontConstants.body2.copyWith(color: Palette.textMedium),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            widget.publication.vaccinated
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: widget.publication.vaccinated
                                ? Palette.successDark
                                : Palette.errorDark,
                            size: 20,
                          ),
                          Text(
                            'Vacunado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            widget.publication.neutered
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: widget.publication.neutered
                                ? Palette.successDark
                                : Palette.errorDark,
                            size: 20,
                          ),
                          Text(
                            'Castrado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            widget.publication.dewormed
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: widget.publication.dewormed
                                ? Palette.successDark
                                : Palette.errorDark,
                            size: 20,
                          ),
                          Text(
                            'Desparasitado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
