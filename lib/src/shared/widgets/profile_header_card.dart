import 'package:flutter/material.dart';

import '../../core/theme_extension.dart';

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
              flex: 3,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    side: BorderSide(
                      color: context.colorScheme.surface,
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
              flex: 7,
                child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "ATTACCANTE",
                      style: TextStyle(
                        //decoration: TextDecoration.underline,
                        decorationColor: context.colorScheme.primary,
                        decorationThickness: 3,
                        //decorationStyle: TextDecorationStyle.double,
                        fontSize: context.textTheme.bodySmall?.fontSize,
                        fontWeight: FontWeight.w500,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Text(
                      "Tony Kross jr",
                        style: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "2012 - 23 ANNI",
                          style: TextStyle(
                            fontSize: context.textTheme.bodySmall?.fontSize,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*
                    Row(
                      children: [
                        CountryFlag.fromCountryCode(
                          'Al',
                          height: 12,
                          width: 15,
                          borderRadius: 2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CountryFlag.fromCountryCode(
                          'It',
                          height: 12,
                          width: 15,
                          borderRadius: 2,
                        ),
                      ],
                    ),
                    */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
