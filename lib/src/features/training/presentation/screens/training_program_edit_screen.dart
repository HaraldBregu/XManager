import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/widgets/svg_loader.dart';

class ProgramEditScreen extends StatefulWidget {
  const ProgramEditScreen({super.key});

  @override
  State<ProgramEditScreen> createState() => _ProgramEditScreenState();
}

class _ProgramEditScreenState extends State<ProgramEditScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  )..repeat();

  late Animation<MaterialColor> f =
      Tween(begin: Colors.red, end: Colors.blue).animate(_animationController);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const topSpace = 50.0;
    const bottomSpace = 50.0;
    const paddingHorizontally = 20.0;
    const paddingVertically = 40.0;
    const selectedOption = 1;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Program'),
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),

          // Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: topSpace,
            ),
          ),

          // Program title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Program title",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Provide or update the title for the program. This title will help you easily identify it when selecting from the list of available programs.",
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 16, bottom: 16, left: 16),
                      hintText: 'Title of program',
                      labelText: 'Title of program',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Divider
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: paddingVertically,
              ),
              child: Divider(),
            ),
          ),

          // Light Selection
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Light selection",
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Choose one or more light positions to use. The available positions are shown below. Select at least one option that best fits your needs.",
                    style: TextStyle(
                      fontSize: context.textTheme.titleSmall?.fontSize,
                      fontFamily: context.textTheme.titleSmall?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder<ElementData>(
                        future: loadSvgImage(
                          svgImage: "assets/upper_area_shoe.svg",
                        ),
                        builder: (context, snapshot) {
                          final outlines = snapshot.data?.outlines ?? [];
                          final lightDots = snapshot.data?.lightDots ?? [];
                          final width = snapshot.data?.width ?? 0;
                          final height = snapshot.data?.height ?? 0;

                          return Row(
                            children: [
                              SizedBox(
                                height: height / 2,
                                width: width / 2,
                                child: InteractiveViewer(
                                  child: Stack(
                                    children: [
                                      for (final outline in outlines) ...[
                                        CustomPaint(
                                          painter: ShoeAreaPainter(
                                            svgPath: outline.path,
                                            strokeColor:
                                                context.colorScheme.onSurface,
                                            strokeWidth: 0.4,
                                            scaleFactor: 0.5,
                                          ),
                                          child: Container(),
                                        ),
                                      ],
                                      for (final lightDot in lightDots) ...[
                                        CustomPaint(
                                          painter: PointPainter(
                                            point:
                                                Offset(lightDot.x, lightDot.y),
                                            color: Colors.blue,
                                            pointSize: 10.0,
                                            scaleFactor: 0.5,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                height: height / 2,
                                width: width / 2,
                                child: InteractiveViewer(
                                  child: Stack(
                                    children: [
                                      for (final outline in outlines) ...[
                                        CustomPaint(
                                          painter: ShoeAreaPainter(
                                            svgPath: outline.path,
                                            strokeColor:
                                                context.colorScheme.onSurface,
                                            strokeWidth: 0.4,
                                            flipHorizontally: true,
                                            scaleFactor: 0.5,
                                          ),
                                          child: Container(),
                                        ),
                                      ],
                                      for (final lightDot in lightDots) ...[
                                        CustomPaint(
                                          painter: PointPainter(
                                            point:
                                                Offset(lightDot.x, lightDot.y),
                                            color: Colors.blue,
                                            pointSize: 10.0,
                                            width: width,
                                            flipHorizontally: true,
                                            scaleFactor: 0.5,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top',
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleMedium?.fontSize,
                                  fontFamily:
                                      context.textTheme.titleMedium?.fontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Checkbox(
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (!states
                                        .contains(WidgetState.selected)) {
                                      return context.colorScheme.onSurface;
                                    }
                                    return context
                                        .colorScheme.secondaryContainer;
                                  },
                                ),
                                tristate: true,
                                value: true,
                                onChanged: null,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Extern',
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleMedium?.fontSize,
                                  fontFamily:
                                      context.textTheme.titleMedium?.fontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Checkbox(
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (!states
                                        .contains(WidgetState.selected)) {
                                      return context.colorScheme.onSurface;
                                    }
                                    return context
                                        .colorScheme.secondaryContainer;
                                  },
                                ),
                                tristate: true,
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Extern',
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleMedium?.fontSize,
                                  fontFamily:
                                      context.textTheme.titleMedium?.fontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Checkbox(
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (!states
                                        .contains(WidgetState.selected)) {
                                      return context.colorScheme.onSurface;
                                    }
                                    return context
                                        .colorScheme.secondaryContainer;
                                  },
                                ),
                                tristate: true,
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Intern',
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleMedium?.fontSize,
                                  fontFamily:
                                      context.textTheme.titleMedium?.fontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Checkbox(
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (!states
                                        .contains(WidgetState.selected)) {
                                      return context.colorScheme.onSurface;
                                    }
                                    return context
                                        .colorScheme.secondaryContainer;
                                  },
                                ),
                                tristate: true,
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Intern',
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleMedium?.fontSize,
                                  fontFamily:
                                      context.textTheme.titleMedium?.fontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Checkbox(
                                fillColor: WidgetStateColor.resolveWith(
                                  (states) {
                                    if (!states
                                        .contains(WidgetState.selected)) {
                                      return context.colorScheme.onSurface;
                                    }
                                    return context
                                        .colorScheme.secondaryContainer;
                                  },
                                ),
                                tristate: true,
                                value: false,
                                onChanged: (bool? value) {},
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
          ),

          // Divider
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: paddingVertically,
              ),
              child: Divider(),
            ),
          ),

          // Light animation
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Light animation",
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Select the desired light animation style. You can choose between the following animations:",
                    style: TextStyle(
                      fontSize: context.textTheme.titleSmall?.fontSize,
                      fontFamily: context.textTheme.titleSmall?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Blink animation',
                        style: TextStyle(
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Radio<int>(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        focusColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fade animation',
                        style: TextStyle(
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Radio<int>(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        focusColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        value: 2,
                        groupValue: selectedOption,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Divider
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: paddingVertically,
              ),
              child: Divider(),
            ),
          ),

          // Duration
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Use the slider to select the desired duration for the program, ranging from 1 minute to 120 minutes. This setting will determine how long the light animation will run.",
                    style: TextStyle(
                      fontSize: context.textTheme.titleSmall?.fontSize,
                      fontFamily: context.textTheme.titleSmall?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "23:00",
                    style: context.textTheme.displayMedium
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 5),
                  SliderTheme(
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                    ),
                    child: Slider(
                      value: 50,
                      max: 100,
                      onChanged: (double value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Divider
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: paddingVertically,
              ),
              child: Divider(),
            ),
          ),

          // Privacy
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Make program private',
                        style: TextStyle(
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith((states) {
                          if (!states.contains(WidgetState.selected)) {
                            return context.colorScheme.onSurface;
                          }
                          return context.colorScheme.secondaryContainer;
                        }),
                        tristate: true,
                        value: false,
                        onChanged: null,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Other permission',
                        style: TextStyle(
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) {
                            if (!states.contains(WidgetState.selected)) {
                              return context.colorScheme.onSurface;
                            }
                            return context.colorScheme.secondaryContainer;
                          },
                        ),
                        tristate: true,
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: bottomSpace,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              label: Text(
                "SAVE",
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
