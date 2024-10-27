import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

class Outline {
  final String id;
  final String path;

  Outline({
    required this.id,
    required this.path,
  });
}

class UpperArea {
  final String id;
  final String path;

  UpperArea({
    required this.id,
    required this.path,
  });
}

class LightDot {
  final String id;
  final double x;
  final double y;
  final double radius;

  LightDot({
    required this.id,
    required this.x,
    required this.y,
    required this.radius,
  });
}

class ElementData {
  List<Outline> outlines;
  List<UpperArea> upperAreas;
  List<LightDot> lightDots;
  double width;
  double height;

  ElementData({
    required this.outlines,
    required this.upperAreas,
    required this.lightDots,
    required this.width,
    required this.height,
  });
}

class ShoeAreaClipper extends CustomClipper<Path> {
  String svgPath;
  final bool flipHorizontally;
  final bool flipVertically;

  ShoeAreaClipper({
    required this.svgPath,
    this.flipHorizontally = false,
    this.flipVertically = false,
  });

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);

    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(1.0, 1.0);
    path = path.transform(matrix4.storage);

    if (flipHorizontally) {
      matrix4.scale(-1.0, 1.0);
      path = path.transform(matrix4.storage);
      path = path.shift(Offset(size.width, 0));
    }
    if (flipVertically) {
      matrix4.scale(1.0, -1.0);
      path = path.transform(matrix4.storage);
      path = path.shift(Offset(0, size.height));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class ShoeAreaPainter extends CustomPainter {
  final String svgPath;
  final Color strokeColor;
  final double strokeWidth;
  final bool flipHorizontally;
  final bool flipVertically;
  final double scaleFactor;

  ShoeAreaPainter({
    required this.svgPath,
    this.strokeColor = Colors.blue,
    this.strokeWidth = 2.0,
    this.flipHorizontally = false,
    this.flipVertically = false,
    this.scaleFactor = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Convert the SVG path string to a Path object
    final Path path = parseSvgPathData(svgPath);
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(scaleFactor, scaleFactor);
    //matrix4.rotateZ(34);
    //matrix4.translate(200);

    final Path newPath = path.transform(matrix4.storage);
    //newPath = newPath.shift(const Offset(200, 0));

    // Create a Paint object for stroking
    final Paint paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    if (flipHorizontally) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }

    if (flipVertically) {
      canvas.scale(1, -1);
      canvas.translate(0, -size.height);
    }

    // Draw the path with stroke
    canvas.drawPath(newPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PointPainter extends CustomPainter {
  final Offset point;
  final Color color;
  final double pointSize;
  final double width;
  final double height;
  final bool flipHorizontally;
  final bool flipVertically;
  final double scaleFactor;

  PointPainter({
    required this.point,
    this.color = Colors.black,
    this.pointSize = 1.0,
    this.width = 0,
    this.height = 0,
    this.flipHorizontally = false,
    this.flipVertically = false,
    this.scaleFactor = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = pointSize;

    final size = Size(width, height);

    if (flipHorizontally) {
      canvas.scale(-scaleFactor, scaleFactor);
      canvas.translate(-size.width, 0);
    }

    if (flipVertically) {
      canvas.scale(scaleFactor, -scaleFactor);
      canvas.translate(0, -size.height);
    }
    
    if (!flipHorizontally && !flipVertically) {
      canvas.scale(scaleFactor, scaleFactor);
    }

    canvas.drawPoints(PointMode.points, [point], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Future<ElementData> loadSvgImage({
  required String svgImage,
}) async {
  final String generalString = await rootBundle.loadString(svgImage);
  final XmlDocument document = XmlDocument.parse(generalString);

  final Iterable<XmlElement> svgs = document.findAllElements('svg');
  final width = double.parse(
    svgs.first.getAttribute('width').toString().replaceAll("px", '').trim(),
  );
  final height = double.parse(
    svgs.first.getAttribute('height').toString().replaceAll("px", '').trim(),
  );

  final paths = document.findAllElements('path');
  final circles = document.findAllElements('circle');
  final elementData = ElementData(
    outlines: [],
    upperAreas: [],
    lightDots: [],
    width: 0,
    height: 0,
  );
  final List<Outline> outlines = [];
  final List<UpperArea> upperAreas = [];
  final List<LightDot> lightDots = [];

  for (final element in paths) {
    final String id = element.getAttribute('id').toString();
    final String partPath = element.getAttribute('d').toString();

    if (id.endsWith("AREA")) {
      upperAreas.add(UpperArea(id: id, path: partPath));
    }

    if (id.endsWith("INLINE") || id.endsWith("OUTLINE")) {
      outlines.add(Outline(id: id, path: partPath));
    }
  }

  for (final circle in circles) {
    final String id = circle.getAttribute('id').toString();
    final double cx = double.parse(circle.getAttribute('cx').toString());
    final double cy = double.parse(circle.getAttribute('cy').toString());
    final double radius = double.parse(circle.getAttribute('r').toString());

    lightDots.add(
      LightDot(
        id: id,
        x: cx,
        y: cy,
        radius: radius,
      ),
    );
  }

  elementData.outlines = outlines;
  elementData.upperAreas = upperAreas;
  elementData.lightDots = lightDots;
  elementData.width = width;
  elementData.height = height;

  return elementData;
}



/*

     
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
            

 */