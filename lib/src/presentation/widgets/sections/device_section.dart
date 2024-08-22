import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/widgets/indicator_icon.dart';

class DeviceSection extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget iconWidget;
  final String title;
  final String description;
  final IndicatorIconState playState;
  final IndicatorIconState bleState;
  final IndicatorIconState chartState;
  final IndicatorIconState updateState;

  const DeviceSection({
    this.padding = const EdgeInsets.fromLTRB(10, 20, 10, 10),
    required this.iconWidget,
    required this.title,
    required this.description,
    required this.playState,
    required this.bleState,
    required this.chartState,
    required this.updateState,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: iconWidget,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.textTheme.headlineSmall?.fontSize,
                        fontFamily: context.textTheme.headlineSmall?.fontFamily,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: context.textTheme.bodyMedium?.fontSize,
                        fontFamily: context.textTheme.bodyMedium?.fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IndicatorIcon(
                          visible:
                              playState != IndicatorIconState.hiddenIconState,
                          padding: const EdgeInsets.only(right: 5),
                          icon: Icons.play_circle,
                          state: playState,
                        ),
                        IndicatorIcon(
                          visible:
                              bleState != IndicatorIconState.hiddenIconState,
                          padding: const EdgeInsets.only(right: 5),
                          icon: Icons.bluetooth,
                          state: bleState,
                        ),
                        IndicatorIcon(
                          visible:
                              chartState != IndicatorIconState.hiddenIconState,
                          padding: const EdgeInsets.only(right: 5),
                          icon: Icons.bar_chart,
                          state: chartState,
                        ),
                        IndicatorIcon(
                          visible:
                              updateState != IndicatorIconState.hiddenIconState,
                          padding: const EdgeInsets.only(right: 5),
                          icon: Icons.update,
                          state: updateState,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
