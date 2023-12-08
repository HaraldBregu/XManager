import 'package:country_flags/country_flags.dart';
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
              flex: 1,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Card(
                  elevation: 4.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    /*borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),*/
                    /*borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),*/
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
              flex: 3,
                child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    Row(
                      children: [
                        const Icon(
                          Icons.flag,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CountryFlag.fromCountryCode(
                          'Al',
                          height: 16,
                          width: 20,
                          borderRadius: 2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CountryFlag.fromCountryCode(
                          'It',
                          height: 16,
                          width: 20,
                          borderRadius: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                      Text(
                      "ATTACCANTE",
                        style: TextStyle(
                        fontSize: context.textTheme.bodySmall?.fontSize,
                      ),
                    ),
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
