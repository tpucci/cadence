import 'dart:ui';

import 'package:app/ui/ds/colors.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              shape:
                  const StadiumBorder(side: BorderSide(color: Colors.white10)),
              child: Stack(children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black.withOpacity(0)),
                  ),
                ),
                Container(
                  color: background.shade800.withOpacity(.6),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      "Great prank plan for Dwight",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: primary.shade50),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
