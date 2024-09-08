import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmanager/src/core/theme_extension.dart';

enum InfoState {
  primaryAlertState,
  infoAlertState,
  warningAlertState,
  successAlertState,
  errorAlertState,
}

Color _contentColorForState(BuildContext context, InfoState state) {
  switch (state) {
    case InfoState.primaryAlertState:
      return context.colorScheme.onPrimaryContainer;
    case InfoState.infoAlertState:
      return Colors.blue;
    case InfoState.warningAlertState:
      return context.colorScheme.secondary;
    case InfoState.successAlertState:
      return Colors.green;
    case InfoState.errorAlertState:
      return context.colorScheme.error;
    default:
      return Colors.white;
  }
}

class InfoContainer extends StatelessWidget {
  final bool visible;
  final String text;
  final IconData? icon;
  final bool? loading;
  final EdgeInsetsGeometry padding;
  final InfoState state;

  const InfoContainer({
    super.key,
    this.visible = true,
    required this.text,
    this.icon,
    this.loading,
    this.padding = EdgeInsets.zero,
    this.state = InfoState.primaryAlertState,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colorScheme.background,
            ),
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(5),
          ),
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
                    // Icon
                    Visibility(
                      visible:
                          icon != null && (loading == null || loading == false),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          icon,
                          color: _contentColorForState(context, state),
                        ),
                      ),
                    ),
                    // Loader icon
                    Visibility(
                      visible: loading != null && loading == true,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: SpinKitCircle(
                          color: Colors.white,
                          size: 28.0,
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
        ),
      ),
    );
  }
}
