import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:loapetition/widgets/layout.dart';

class SuggestionWritePage extends StatefulWidget {
  const SuggestionWritePage({super.key});

  @override
  State<SuggestionWritePage> createState() => _SuggestionWritePageState();
}

class _SuggestionWritePageState extends State<SuggestionWritePage> {
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        child: Center(
            child: Column(
      children: [
        QuillSimpleToolbar(
          controller: _controller,
          configurations: const QuillSimpleToolbarConfigurations(),
        ),
        Expanded(
          child: QuillEditor.basic(
            controller: _controller,
            configurations: const QuillEditorConfigurations(),
          ),
        ),
      ],
    )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
