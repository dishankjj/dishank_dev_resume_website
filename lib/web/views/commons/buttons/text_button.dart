import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    required this.isSelected,
    required this.label,
    required this.textHighlightColor,
    required this.callback,
    this.labelStyle,
    this.size,
    super.key,
  });

  final bool isSelected;
  final String label;
  final int textHighlightColor;
  final VoidCallback callback;
  final TextStyle? labelStyle;
  final Size? size;

  @override
  State<AppTextButton> createState() => _ButtonVariantState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected))
      ..add(StringProperty('label', label))
      ..add(IntProperty('textHighlightColor', textHighlightColor))
      ..add(ObjectFlagProperty<VoidCallback>.has('callback', callback))
      ..add(DiagnosticsProperty<TextStyle?>('labelStyle', labelStyle))
      ..add(DiagnosticsProperty<Size?>('size', size));
  }
}

class _ButtonVariantState extends State<AppTextButton> {
  late final WidgetStatesController _controller;

  late final AnimationController _animationController;

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
  Widget build(final BuildContext context) {
    return ElevatedButton(
          statesController: _controller,
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll<Size?>(widget.size),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              Colors.transparent,
            ),
            shadowColor: const WidgetStatePropertyAll<Color>(
              Colors.transparent,
            ),
          ),
          onHover: (final bool value) {
            _animationController.toggle();
          },
          onPressed: widget.callback,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (final BuildContext context, final Widget? snapshot) {
              return Text(
                widget.label,
                style: widget.labelStyle?.copyWith(
                  color:
                      _controller.value.any(
                                (final WidgetState state) =>
                                    <WidgetState>[WidgetState.pressed].any(
                                      (final WidgetState element) =>
                                          element == state,
                                    ),
                              ) ||
                              widget.isSelected
                          ? Color(widget.textHighlightColor)
                          : null,
                ),
              );
            },
          ),
        )
        .animate(
          onInit: (final AnimationController controller) {
            _animationController = controller;
          },
        )
        .scaleXY(
          begin: 1.2,
          end: 1,
          duration: const Duration(milliseconds: 200),
        )
        .flipH(begin: 0.25, end: 0, perspective: -2);
  }
}
