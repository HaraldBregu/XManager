import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class TrainingCard extends StatelessWidget {
  const TrainingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              ColoredBox(
                color: context.colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 25, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Program section",
                              style: TextStyle(
                                fontSize:
                                    context.textTheme.titleLarge?.fontSize,
                                fontWeight: FontWeight.bold,
                                color: context.colorScheme.onSecondaryContainer,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.radio_button_checked_rounded,
                                  color: context.colorScheme.secondary,
                                  size: 15,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "trainning progress",
                                  style: TextStyle(
                                    color: context
                                        .colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.trip_origin,
                                  color: context.colorScheme.error,
                                  size: 15,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "one",
                                  style: TextStyle(
                                    color: context
                                        .colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.trip_origin,
                                  color: context.colorScheme.secondary,
                                  size: 15,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "00:12:05",
                                  style: TextStyle(
                                    color: context
                                        .colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 30,
                        bottom: 30,
                        right: 30,
                      ),
                      child: TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: 0.6),
                        duration: const Duration(seconds: 60),
                        builder: (context, value, _) {
                          return CircularPercentIndicator(
                            radius: 60,
                            lineWidth: 8,
                            percent: value,
                            progressColor: context.colorScheme.secondary,
                            backgroundColor: context.colorScheme.onTertiary,
                            circularStrokeCap: CircularStrokeCap.square,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bolt,
                                  size: 22,
                                  color: context.colorScheme.secondary,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '${(value * 100).round()} %',
                                  style: TextStyle(
                                    fontSize:
                                        context.textTheme.titleLarge?.fontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Training list',
                  style: TextStyle(
                    //fontSize: context.textTheme.titleSmall?.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //subtitle: Text("Per iniziare ad utilizzare!"),
                onTap: () {},
                //isThreeLine: true,
                trailing: Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _DashboardPageTrainingSection extends StatelessWidget {
  const _DashboardPageTrainingSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: ListTile(
                title: const Text(
                  'TRAINING LIST',
                ),
                subtitle: Text("Per iniziare ad utilizzare!"),
                onTap: () {},
                //isThreeLine: true,
                trailing: const Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 5,
                        right: 5,
                      ),
                      title: Text(
                        'IN ESECUZIONE',
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        "Allenamento pesante con tanti sforzi e tanto sudore",
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      leading: IconButton(
                        color: colorScheme.secondary,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.layers,
                          size: 28,
                        ),
                      ),
                      trailing: IconButton(
                        color: colorScheme.tertiary,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: colorScheme.background,
                        radius: 120,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(120),
                          ),
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 0.75),
                            duration: const Duration(seconds: 10),
                            builder: (context, value, _) {
                              return CircularPercentIndicator(
                                radius: 110,
                                lineWidth: 14,
                                percent: value,
                                //progressColor: colorScheme.secondary,
                                //backgroundColor: colorScheme.onSecondary,
                                progressColor: colorScheme.tertiary,
                                backgroundColor: colorScheme.onTertiary,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bolt,
                                      size: 28,
                                      color: colorScheme.secondary,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '${(value * 100).round()} %',
                                      style: context.textTheme.headlineLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          //flex: 2,
                          child: ListTile(
                            title: Text(
                              "DURATA",
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              "00:26:00",
                              style: context.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          //flex: 2,
                          child: ListTile(
                            title: Text(
                              "COUNTDOWN",
                              textAlign: TextAlign.right,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              "00:25:46",
                              textAlign: TextAlign.right,
                              style: context.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/