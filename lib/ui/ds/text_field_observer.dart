import 'package:app/ui/ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class TextFieldObserver extends StatefulWidget {
  const TextFieldObserver(
      {super.key, required this.onChanged, required this.getter});

  final Function(String) onChanged;
  final String Function() getter;

  @override
  State<TextFieldObserver> createState() => _TextFieldObserverState();
}

class _TextFieldObserverState extends State<TextFieldObserver> {
  late TextEditingController _controller;
  late VoidCallback _disposer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _disposer = reaction<String>(
      (_) => widget.getter(),
      (val) => _controller.value = _controller.value.copyWith(text: val),
      fireImmediately: true,
    );
  }

  @override
  void dispose() {
    _disposer();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: (value) => widget.onChanged(value),
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
            .copyWith(color: Colors.grey.shade900));
  }
}
