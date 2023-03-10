import 'package:app/features/issues/stores/issue_store.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:app/utils/mobx/with_text_editing_controller.dart';
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
                    side: issue.selected
                        ? BorderSide(
                            color: secondary.shade500,
                            width: 4,
                          )
                        : BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: background.shade100,
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    hoverColor: background.shade300,
                    canRequestFocus: false,
                    onTap: () => issue.toggleSelection(),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: WithTextEditingController(
                        getValue: () => issue.title,
                        builder: (_, controller) => TextField(
                            controller: controller,
                            onChanged: (value) => issue.rename(value),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Enter issue title",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey.shade700),
                              border: InputBorder.none,
                            ),
                            textAlignVertical: TextAlignVertical.top,
                            cursorColor: secondary.shade600,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
