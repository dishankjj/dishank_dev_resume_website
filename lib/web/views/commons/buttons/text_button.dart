import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  final bool isSelected;
  final String label;
  final TextStyle? labelStyle;
  final int textHighlightColor;
  final VoidCallback callback;
  final Size? size;
  const AppTextButton({
    required this.isSelected,
    required this.label,
    this.labelStyle,
    required this.textHighlightColor,
    required this.callback,
    this.size,
    super.key,
  });

  @override
  State<AppTextButton> createState() => _ButtonVariantState();
}

class _ButtonVariantState extends State<AppTextButton> {
  late final WidgetStatesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WidgetStatesController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      statesController: _controller,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(widget.size),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      onPressed: widget.callback,
      child: ListenableBuilder(
          listenable: _controller,
          builder: (context, snapshot) {
            return Text(
              widget.label,
              style: widget.labelStyle?.copyWith(
                  color: _controller.value.any((state) => [WidgetState.pressed]
                              .any((element) => element == state)) ||
                          widget.isSelected
                      ? Color(widget.textHighlightColor)
                      : null),
            );
          }),
    );
  }
}
