import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/postulations/postulations_list_screen.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/features/posts/domain/post/post/post.dart';
import 'package:pet_home/features/posts/presentation/post/edit_post_Screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class OwnPostDial extends ConsumerStatefulWidget {
  const OwnPostDial({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  ConsumerState<OwnPostDial> createState() => _OwnPostDialState();
}

class _OwnPostDialState extends ConsumerState<OwnPostDial> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Pethome.dog_nose,
      activeIcon: Icons.clear_outlined,
      spacing: 20,
      children: [
        SpeedDialChild(
          child: const Icon(
            Pethome.form,
            color: Palette.primary,
          ),
          label: 'Solicitudes de adopción',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          onTap: () => ref.read(appRouterProvider).pushNamed(
            PostulationsListScreen.path,
            queryParameters: {'postId': widget.post.id.toString()},
          ),
        ),
        SpeedDialChild(
          child: const Icon(
            Pethome.edit,
            color: Palette.primary,
            size: 22,
          ),
          label: 'Editar',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          onTap: () => ref
              .read(appRouterProvider)
              .pushNamed(EditPostScreen.path, extra: widget.post),
        ),
        SpeedDialChild(
          child: const Icon(
            Pethome.trash,
            color: Palette.primary,
          ),
          label: 'Eliminar',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          onTap: () => ref.read(customModalsProvider).showInfoDialog(
                title: '¿Estás seguro?',
                content:
                    'La publicacion será eliminada de forma permanente y no podrás recuperarla.',
                buttonText: 'Eliminar',
                buttonAction: () {
                  ref.read(appRouterProvider).pop();
                  ref
                      .read(publicationsNotifierProvider.notifier)
                      .deletePost(postId: widget.post.id);
                },
              ),
        ),
      ],
    );
  }
}
