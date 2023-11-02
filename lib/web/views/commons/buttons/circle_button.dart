import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class AppCircleButton extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final VoidCallback callback;
  final int highlightColor;
  final int? bgColor;
  final int borderColor;
  final double borderRadius;
  final Size? size;
  final EdgeInsets? padding;
  const AppCircleButton({
    required this.label,
    this.labelStyle,
    required this.callback,
    required this.highlightColor,
    this.bgColor,
    required this.borderColor,
    required this.borderRadius,
    this.size,
    this.padding,
    super.key,
  });

  @override
  State<AppCircleButton> createState() => _AppCircleButtonState();
}

class _AppCircleButtonState extends State<AppCircleButton> {
  late final MaterialStatesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MaterialStatesController();
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
        padding: MaterialStatePropertyAll(widget.padding),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Color(widget.borderColor),
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(widget.size),
        backgroundColor:
            MaterialStatePropertyAll(Color(widget.bgColor ?? 0x00)),
        overlayColor: MaterialStatePropertyAll(Color(widget.highlightColor)),
      ),
      onPressed: widget.callback,
      child: ListenableBuilder(
          listenable: _controller,
          builder: (context, snapshot) {
            return Text(
              widget.label,
              style: widget.labelStyle?.copyWith(
                  color: _controller.value.any((state) => [
                            MaterialState.hovered,
                            MaterialState.pressed
                          ].any((element) => element == state))
                      ? const Color(AppColor.bgBlack)
                      : null),
            );
          }),
    );
  }
}
