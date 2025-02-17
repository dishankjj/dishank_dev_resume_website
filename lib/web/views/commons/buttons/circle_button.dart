import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppCircleButton extends StatefulWidget {
  const AppCircleButton({
    required this.label,
    required this.callback,
    required this.highlightColor,
    required this.borderColor,
    required this.borderRadius,
    this.labelStyle,
    this.bgColor,
    this.padding,
    super.key,
  });

  final String label;
  final VoidCallback callback;
  final int highlightColor;
  final int borderColor;
  final double borderRadius;
  final TextStyle? labelStyle;
  final Color? bgColor;
  final EdgeInsets? padding;

  @override
  State<AppCircleButton> createState() => _AppCircleButtonState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(DiagnosticsProperty<TextStyle?>('labelStyle', labelStyle))
      ..add(ObjectFlagProperty<VoidCallback>.has('callback', callback))
      ..add(IntProperty('highlightColor', highlightColor))
      ..add(ColorProperty('bgColor', bgColor))
      ..add(IntProperty('borderColor', borderColor))
      ..add(DoubleProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty<EdgeInsets?>('padding', padding));
  }
}

class _AppCircleButtonState extends State<AppCircleButton> {
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
  Widget build(final BuildContext context) {
    return ElevatedButton(
      statesController: _controller,

      style: ButtonStyle(
        padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(widget.padding),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Color(widget.borderColor)),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
          widget.bgColor ?? Colors.transparent,
        ),
        overlayColor: WidgetStatePropertyAll<Color>(
          Color(widget.highlightColor),
        ),
      ),
      onPressed: widget.callback,
      child: ListenableBuilder(
        listenable: _controller,
        builder: (final BuildContext context, final Widget? snapshot) {
          return Text(
            widget.label,
            style: widget.labelStyle?.copyWith(
              color:
                  _controller.value.any(
                        (final WidgetState state) => <WidgetState>[
                          WidgetState.hovered,
                          WidgetState.pressed,
                        ].any((final WidgetState element) => element == state),
                      )
                      ? const Color(AppColor.bgBlack)
                      : null,
            ),
          );
        },
      ),
    );
  }
}
