import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/core/widgets/svg_loader.dart';

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
    const paddingHorizontally = 20.0;
    int selectedOption = 1;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Program'),
            pinned: true,
            //snap: false,
            //floating: false,
            /*
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("testo"),
          ),*/
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),

          // Program title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Program title",
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Provide or update the title for the program. This title will help you easily identify it when selecting from the list of available programs.",
                    style: TextStyle(
                      fontSize: context.textTheme.titleSmall?.fontSize,
                      fontFamily: context.textTheme.titleSmall?.fontFamily,
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
              padding: EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
              ),
              child: Divider(),
            ),
          ),

          // Light Selection
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
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
                      Text(
                        'Top',
                        style: TextStyle(
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
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
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) {
                            print(states);
                            final f = WidgetState.selected;
                            return context.colorScheme.secondary;
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
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        isError: true,
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
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        isError: true,
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
                          fontSize: context.textTheme.titleMedium?.fontSize,
                          fontFamily: context.textTheme.titleMedium?.fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => context.colorScheme.secondary,
                        ),
                        isError: true,
                        tristate: true,
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                    ],
                  ),
                  FutureBuilder<ElementData>(
                    future:
                        loadSvgImage(svgImage: "assets/upper_area_shoe.svg"),
                    builder: (context, snapshot) {
                      final outlines = snapshot.data?.outlines ?? [];
                      final upperAreas = snapshot.data?.upperAreas ?? [];
                      final lightDots = snapshot.data?.lightDots ?? [];
                      final width = snapshot.data?.width ?? 0;
                      final height = snapshot.data?.height ?? 0;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height,
                            width: width,
                            //color: Colors.black45,
                            child: InteractiveViewer(
                              child: Stack(
                                children: [
                                  for (final outline in outlines) ...[
                                    CustomPaint(
                                      painter: ShoeAreaPainter(
                                        svgPath: outline.path,
                                        strokeColor:
                                            context.colorScheme.onBackground,
                                        strokeWidth: 0.2,
                                      ),
                                      child: Container(),
                                    ),
                                  ],
                                  for (final area in upperAreas) ...[
                                    ClipPath(
                                      clipper: ShoeAreaClipper(
                                        svgPath: area.path,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("Selected area: ${area.id}");
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ],
                                  for (final lightDot in lightDots) ...[
                                    CustomPaint(
                                      painter: PointPainter(
                                        point: Offset(lightDot.x, lightDot.y),
                                        color: Colors.blue,
                                        pointSize: 4.0,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            height: height,
                            width: width,
                            //color: Colors.black45,
                            child: InteractiveViewer(
                              child: Stack(
                                children: [
                                  for (final outline in outlines) ...[
                                    CustomPaint(
                                      painter: ShoeAreaPainter(
                                        svgPath: outline.path,
                                        strokeColor:
                                            context.colorScheme.onBackground,
                                        strokeWidth: 0.2,
                                        flipHorizontally: true,
                                      ),
                                      child: Container(),
                                    ),
                                  ],
                                  for (final area in upperAreas) ...[
                                    ClipPath(
                                      clipper: ShoeAreaClipper(
                                        svgPath: area.path,
                                        flipHorizontally: true,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("Selected area: ${area.id}");
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ],
                                  for (final lightDot in lightDots) ...[
                                    CustomPaint(
                                      painter: PointPainter(
                                        point: Offset(lightDot.x, lightDot.y),
                                        color: Colors.blue,
                                        pointSize: 4.0,
                                        width: width,
                                        flipHorizontally: true,
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
                ],
              ),
            ),
          ),

          // Divider
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
              ),
              child: Divider(),
            ),
          ),

          // Light animation
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
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
              padding: EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
              ),
              child: Divider(),
            ),
          ),

          // Duration
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                50,
                paddingHorizontally,
                0,
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
                  Slider(
                    value: 50,
                    max: 100,
                    onChanged: (double value) {
                      print(value);
                    },
                  ),
                ],
              ),
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
                "SALVE",
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
