import 'package:app/features/gesture_handler/gesture_handler.dart';
import 'package:app/features/grid/grid.dart';
import 'package:app/features/issues/issue_cards_renderer.dart';
import 'package:app/features/title_bar/title_bar.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GestureHandlerWidget());
  }
}

class GestureHandlerWidget extends StatelessWidget {
  const GestureHandlerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background.shade900,
      child: Stack(children: [
        const Grid(),
        GestureHandler(children: [IssueCardsRenderer()]),
        const TitleBar(),
      ]),
    );
  }
}
