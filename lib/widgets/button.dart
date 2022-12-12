import 'package:flutter/cupertino.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.cursor,
    this.color,
    this.padding,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.alignment = Alignment.center,
  }) : _filled = false;

  const AppButton.filled({
    super.key,
    required this.child,
    required this.onPressed,
    this.cursor,
    this.padding,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.alignment = Alignment.center,
  })  : color = null,
        _filled = true;

  final Widget child;
  final VoidCallback? onPressed;
  final MouseCursor? cursor;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color disabledColor;
  final double? minSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final bool _filled;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor ?? SystemMouseCursors.click,
      child: _filled
          ? CupertinoButton.filled(
              onPressed: onPressed,
              padding: padding,
              alignment: alignment,
              borderRadius: borderRadius,
              disabledColor: disabledColor,
              minSize: minSize,
              pressedOpacity: pressedOpacity,
              child: child,
            )
          : CupertinoButton(
              onPressed: onPressed,
              color: color,
              padding: padding,
              alignment: alignment,
              borderRadius: borderRadius,
              disabledColor: disabledColor,
              minSize: minSize,
              pressedOpacity: pressedOpacity,
              child: child,
            ),
    );
  }
}
