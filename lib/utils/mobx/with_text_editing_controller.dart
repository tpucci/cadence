import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class WithTextEditingController extends StatefulWidget {
  const WithTextEditingController(
      {super.key, required this.getValue, required this.builder});

  final String Function() getValue;
  final Widget Function(BuildContext, TextEditingController) builder;

  @override
  State<WithTextEditingController> createState() =>
      _WithTextEditingControllerState();
}

class _WithTextEditingControllerState extends State<WithTextEditingController> {
  late TextEditingController _controller;
  late VoidCallback _disposer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _disposer = reaction<String>(
      (_) => widget.getValue(),
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
    return widget.builder(context, _controller);
  }
}
