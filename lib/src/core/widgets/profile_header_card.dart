import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 15,
          bottom: 15,
          right: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Card(
                  elevation: 4.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: ImageFiltered(
                    imageFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile6.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dominic Toreto",
                        style: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "23 ANNI",
                        style: TextStyle(
                          fontSize: context.textTheme.bodySmall?.fontSize,
                        ),
                      ),
                      Text(
                        "ATTACCANTE",
                        style: TextStyle(
                          fontSize: context.textTheme.bodyMedium?.fontSize,
                        ),
                      ),
                      Text(
                        "Italiana",
                        style: TextStyle(
                          fontSize: context.textTheme.bodyLarge?.fontSize,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
