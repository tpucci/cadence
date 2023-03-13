import 'package:app/features/issues/stores/issue_store.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:app/utils/mobx/with_text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class IssueCard extends StatefulWidget {
  final Issue issue;
  const IssueCard({super.key, required this.issue});

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  late FocusNode _textFieldFocusNode;

  DateTime? _tapLastDateTime;

  @override
  void initState() {
    super.initState();

    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _textFieldFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Positioned(
              left: widget.issue.offset.dx,
              top: widget.issue.offset.dy,
              child: SizedBox(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: widget.issue.selected
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
                    hoverColor: background.shade200,
                    onHighlightChanged: (value) {
                      widget.issue.select();
                    },
                    onTapDown: (_) => widget.issue.startFollowingPointer(),
                    onTapUp: (_) => widget.issue.stopFollowingPointer(),
                    onTap: () {
                      widget.issue.select();

                      // Handle double tap
                      final tapDateTime = DateTime.now();
                      if (_tapLastDateTime != null &&
                          tapDateTime.millisecondsSinceEpoch -
                                  _tapLastDateTime!.millisecondsSinceEpoch <
                              500) {
                        setState(() {
                          _textFieldFocusNode.requestFocus();
                        });
                      }
                      _tapLastDateTime = tapDateTime;
                    },
                    child: IgnorePointer(
                      ignoring: !_textFieldFocusNode.hasFocus,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: WithTextEditingController(
                          getValue: () => widget.issue.title,
                          builder: (_, controller) => TextField(
                              controller: controller,
                              focusNode: _textFieldFocusNode,
                              onChanged: (value) => widget.issue.rename(value),
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
              ),
            ));
  }
}
