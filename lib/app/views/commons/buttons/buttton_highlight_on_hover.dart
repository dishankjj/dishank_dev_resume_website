import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class ButtonHighlightOnHover extends StatefulWidget {
  const ButtonHighlightOnHover.light(this.label, {this.callback, super.key})
      : bgDarkColor = false;

  const ButtonHighlightOnHover.dark(this.label, {this.callback, super.key})
      : bgDarkColor = true;

  final String label;
  final VoidCallback? callback;
  final bool bgDarkColor;

  @override
  State<ButtonHighlightOnHover> createState() => _ButtonHighlightOnHoverState();
}

class _ButtonHighlightOnHoverState extends State<ButtonHighlightOnHover> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          style: ButtonStyle(
            animationDuration: kThemeChangeDuration,
            backgroundColor: MaterialStateProperty.all(isHovering
                ? const Color(WebColorAsset.bgYellow)
                : const Color(WebColorAsset.bgBlack)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: Color(WebColorAsset.bgYellow),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            shadowColor: MaterialStateProperty.all(widget.bgDarkColor
                ? const Color(WebColorAsset.bgYellow)
                : null),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 36)),
          ),
          onPressed: widget.callback,
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isHovering
                      ? const Color(WebColorAsset.bgBlack)
                      : const Color(WebColorAsset.textWhite),
                ),
          ),
        ),
      ),
    );
  }
}
