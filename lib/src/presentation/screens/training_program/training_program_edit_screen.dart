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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('New program'),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Name of program",
                      style: TextStyle(
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Set a name fot this program in order to make it reconizable fron other programs.",
                      style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        fontFamily: context.textTheme.bodySmall?.fontFamily,
                        //fontWeight: FontWeight.bold,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 16, bottom: 16, left: 16),
                      hintText: '',
                      labelText: 'Program name',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Light selection",
                      style: TextStyle(
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Touch and select the position you want to use.",
                      style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        fontFamily: context.textTheme.bodySmall?.fontFamily,
                        //fontWeight: FontWeight.bold,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Select the animation",
                      style: TextStyle(
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Set a name fot this program in order to make it reconizable fron other programs.",
                      style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        fontFamily: context.textTheme.bodySmall?.fontFamily,
                        //fontWeight: FontWeight.bold,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: 16,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: "0", child: Text("Item one")),
                      DropdownMenuItem(value: "1", child: Text("Item two")),
                      DropdownMenuItem(value: "2", child: Text("Item three")),
                    ],
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Select duration",
                      style: TextStyle(
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      "Set a name fot this program in order to make it reconizable fron other programs.",
                      style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        fontFamily: context.textTheme.bodySmall?.fontFamily,
                        //fontWeight: FontWeight.bold,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {},
                    child: const Text('SALVA'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
