import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:async';

TextEditingController useSearch({
  Duration debounceDuration = const Duration(milliseconds: 300),
  required void Function(String) onSearch,
}) {
  return use(_Search(
    debounceDuration: debounceDuration,
    onSearch: onSearch,
  ));
}

class _Search extends Hook<TextEditingController> {
  final Duration debounceDuration;
  final void Function(String) onSearch;

  const _Search({
    required this.debounceDuration,
    required this.onSearch,
  });

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends HookState<TextEditingController, _Search> {
  late TextEditingController controller;
  late Timer? _timer;

  _SearchState() {
    _timer = null;
  }

  @override
  void initHook() {
    super.initHook();
    controller = TextEditingController();
    controller.addListener(onTextChanged);
  }

  void onTextChanged() {
    _timer?.cancel();
    _timer = Timer(hook.debounceDuration, () {
      hook.onSearch(controller.text);
    });
  }

  @override
  TextEditingController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }
}
