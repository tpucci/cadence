import 'dart:math';

import 'package:app/features/issues/stores/issue_store.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class IssueCard extends StatelessWidget {
  static final rnd = Random();

  IssueCard({super.key});

  final store = IssueStore(
      offset: Offset(rnd.nextDouble() * 1000, rnd.nextDouble() * 1000));

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Transform.translate(
          offset: store.offset,
          child: SizedBox.fromSize(
            size: const Size(200, 100),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: background.shade100,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Hello World",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey.shade900)),
                )),
          )),
    );
  }
}
