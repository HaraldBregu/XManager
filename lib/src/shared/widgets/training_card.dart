import 'package:flutter/material.dart';
import '../../core/theme_extension.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final List<String> options;
  final Future<void> Function(String) onTapOption;

  const TrainingCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    required this.options,
    required this.onTapOption,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              ColoredBox(
                color: context.colorScheme.primaryContainer,
                //color: context.colorScheme.errorContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 25,
                          bottom: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: context
                                            .textTheme.titleMedium?.fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      subtitle,
                                      style: TextStyle(
                                        fontSize: context
                                            .textTheme.bodySmall?.fontSize,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    if (description != null) ...[
                                      Text(
                                        description!,
                                        style: TextStyle(
                                          fontSize: context
                                              .textTheme.bodySmall?.fontSize,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                if (options.isNotEmpty) ...[
                                  PopupMenuButton(
                                    itemBuilder: (context) => [
                                      for (var option in options) ...[
                                        PopupMenuItem(
                                          child: Text(option),
                                          onTap: () async {
                                            await onTapOption(option);
                                          },
                                        )
                                      ]
                                    ],
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "COUNTDOWN",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: context
                                                .colorScheme.onPrimaryContainer,
                                            fontSize: context
                                                .textTheme.labelSmall?.fontSize,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '12',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ':',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '34',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "COMPLETED",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: context
                                                .colorScheme.onPrimaryContainer,
                                            fontSize: context
                                                .textTheme.labelSmall?.fontSize,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '5',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '/32',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "PROGRESS",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: context
                                                .colorScheme.onPrimaryContainer,
                                            fontSize: context
                                                .textTheme.labelSmall?.fontSize,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '25',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                  fontSize: context.textTheme
                                                      .titleLarge?.fontSize,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TweenAnimationBuilder(
                                  tween: Tween(begin: 0.0, end: 0.8),
                                  duration: const Duration(seconds: 60),
                                  builder: (context, value, _) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: LinearProgressIndicator(
                                        value: value,
                                        minHeight: 25,
                                        backgroundColor:
                                            context.colorScheme.onSecondary,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                context.colorScheme.secondary),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
