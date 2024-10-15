import 'package:flutter/material.dart';
import '../../core/theme_extension.dart';

enum ProgresState {
  primaryProgressState,
  infoProgressState,
  warningProgressState,
  successProgressState,
  errorProgressState,
}

Color _contentColorForState(BuildContext context, ProgresState state) {
  switch (state) {
    case ProgresState.primaryProgressState:
      return Colors.white;
    case ProgresState.infoProgressState:
      return Colors.blue;
    case ProgresState.warningProgressState:
      return context.colorScheme.secondary;
    case ProgresState.successProgressState:
      return Colors.green;
    case ProgresState.errorProgressState:
      return context.colorScheme.error;
    default:
      return Colors.white;
  }
}

class ProgressCard extends StatelessWidget {
  final String text;
  final double? elevation;
  final double percentValue;
  final ProgresState state;

  const ProgressCard({
    super.key,
    required this.text,
    this.elevation,
    required this.percentValue,
    this.state = ProgresState.primaryProgressState,
  });

  @override
  Widget build(BuildContext context) {
    final textPercentage = percentValue.toInt().toString();
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "$textPercentage%",
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              minHeight: 10,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              value: percentValue / 100,
              valueColor:
                  AlwaysStoppedAnimation(_contentColorForState(context, state)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressSliverCard extends StatelessWidget {
  final bool visible;
  final EdgeInsetsGeometry padding;
  final String text;
  final double? elevation;
  final double percentValue;
  final ProgresState state;

  const ProgressSliverCard({
    super.key,
    this.visible = true,
    required this.text,
    this.elevation,
    required this.percentValue,
    this.padding = EdgeInsets.zero,
    this.state = ProgresState.primaryProgressState,
  });

  @override
  Widget build(BuildContext context) {
    return SliverVisibility(
      visible: visible,
      sliver: SliverPadding(
        padding: padding,
        sliver: SliverToBoxAdapter(
          child: ProgressCard(
            text: text,
            elevation: elevation,
            percentValue: percentValue,
            state: state,
          ),
        ),
      ),
    );
  }
}
