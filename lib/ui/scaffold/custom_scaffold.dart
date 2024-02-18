import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/palette.dart';

class CustomScaffold extends ConsumerStatefulWidget {
  const CustomScaffold({
    required this.body,
    this.withPadding = true,
    this.appbarColor = Colors.white,
    this.appbarElevation,
    this.appbarIconColor = Palette.primary00,
    super.key,
  });

  final Widget body;
  final bool withPadding;
  final Color appbarColor;
  final Color appbarIconColor;
  final double? appbarElevation;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends ConsumerState<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appbarColor,
        elevation: widget.appbarElevation,
        iconTheme: IconThemeData(color: widget.appbarIconColor),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: widget.withPadding
                  ? const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    )
                  : EdgeInsets.zero,
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }
}
