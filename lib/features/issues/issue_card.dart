import 'package:app/features/issues/stores/issue_store.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:app/ui/ds/text_field_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class IssueCard extends StatelessWidget {
  final Issue issue;
  const IssueCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Positioned(
              left: issue.offset.dx,
              top: issue.offset.dy,
              child: SizedBox(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: background.shade100,
                  elevation: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFieldObserver(
                        onChanged: (value) => issue.rename(value),
                        getter: () => issue.title,
                      )),
                ),
              ),
            ));
  }
}
