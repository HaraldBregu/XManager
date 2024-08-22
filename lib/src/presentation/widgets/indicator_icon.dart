import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xmanager/src/core/theme_extension.dart';

enum IndicatorIconState {
  hiddenIconState,
  initialIndicatorIconState,
  activeIndicatorIconState,
  warningIndicatorIconState,
  successIndicatorIconState,
  errorIndicatorIconState,
}

Color _contentColorForState(BuildContext context, IndicatorIconState state) {
  switch (state) {
    case IndicatorIconState.initialIndicatorIconState:
      return context.colorScheme.primary;
    case IndicatorIconState.activeIndicatorIconState:
      return Colors.blue;
    case IndicatorIconState.warningIndicatorIconState:
      return context.colorScheme.secondary;
    case IndicatorIconState.successIndicatorIconState:
      return Colors.green;
    case IndicatorIconState.errorIndicatorIconState:
      return context.colorScheme.error;
    default:
      return Colors.white;
  }
}

class IndicatorIcon extends StatelessWidget {
  final bool visible;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final IndicatorIconState state;

  const IndicatorIcon({
    super.key,
    this.visible = true,
    this.padding = EdgeInsets.zero,
    required this.icon,
    this.state = IndicatorIconState.initialIndicatorIconState,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          size: 25,
          color: _contentColorForState(context, state),
        ),
      ),
    );
  }
}
