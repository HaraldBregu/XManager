import 'package:flutter/material.dart';

import '../../core/theme_extension.dart';

enum AlertState {
  primaryAlertState,
  infoAlertState,
  warningAlertState,
  successAlertState,
  errorAlertState,
}

Color _contentColorForState(BuildContext context, AlertState state) {
  switch (state) {
    case AlertState.primaryAlertState:
      return Colors.white;
    case AlertState.infoAlertState:
      return Colors.blue;
    case AlertState.warningAlertState:
      return context.colorScheme.secondary;
    case AlertState.successAlertState:
      return Colors.green;
    case AlertState.errorAlertState:
      return context.colorScheme.error;
    default:
      return Colors.white;
  }
}

class Alert extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? elevation;
  final AlertState state;

  const Alert({
    super.key,
    required this.text,
    this.icon,
    this.elevation,
    this.state = AlertState.primaryAlertState,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Visibility(
                  visible: icon != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      icon,
                      color: _contentColorForState(context, state),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.w500,
                      color: _contentColorForState(context, state),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final bool visible;
  final String text;
  final IconData? icon;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final AlertState state;

  const AlertCard({
    super.key,
    this.visible = true,
    required this.text,
    this.icon,
    this.elevation,
    this.padding = EdgeInsets.zero,
    this.state = AlertState.primaryAlertState,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: padding,
        child: Alert(
          state: state,
          text: text,
          icon: icon,
          elevation: elevation,
        ),
      ),
    );
  }
}

class AlertSliverCard extends StatelessWidget {
  final bool visible;
  final String text;
  final IconData? icon;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final AlertState state;

  const AlertSliverCard({
    super.key,
    this.visible = true,
    required this.text,
    this.icon,
    this.elevation,
    this.padding = EdgeInsets.zero,
    this.state = AlertState.primaryAlertState,
  });

  @override
  Widget build(BuildContext context) {
    return SliverVisibility(
      visible: visible,
      sliver: SliverPadding(
        padding: padding,
        sliver: SliverToBoxAdapter(
          child: Alert(
            state: state,
            text: text,
            icon: icon,
            elevation: elevation,
          ),
        ),
      ),
    );
  }
}
