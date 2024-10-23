import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';
import 'package:xmanager/src/shared/widgets/info_container.dart';

typedef UploadProgram = void Function(ProgramEntity program);

Future<void> showModalBottomSheetProgramUploader({
  required BuildContext context,
  required ProgramEntity program,
  required UploadProgram onStartUploading,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    enableDrag: false,
    isDismissible: false,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 20.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Start training",
                    style: TextStyle(
                      fontSize: context.textTheme.titleLarge?.fontSize,
                      fontFamily: context.textTheme.titleLarge?.fontFamily,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.directions_run,
                            size: 18,
                            color: context.colorScheme.onSurface,
                          ),
                          Text(
                            program.title,
                            style: TextStyle(
                              fontSize: context.textTheme.bodyMedium?.fontSize,
                              fontFamily:
                                  context.textTheme.bodyMedium?.fontFamily,
                              fontWeight: FontWeight.w400,
                              color: context.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: 18,
                            color: context.colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "34:00",
                            style: TextStyle(
                              fontSize: context.textTheme.bodyMedium?.fontSize,
                              fontFamily:
                                  context.textTheme.bodyMedium?.fontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bluetooth,
                        size: 18,
                        color: context.colorScheme.onSurface,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        program.deviceType == DeviceType.dinamo
                            ? "Dinamo v${program.deviceVersion}"
                            : "NoDevice",
                        style: TextStyle(
                          fontSize: context.textTheme.bodyMedium?.fontSize,
                          fontFamily: context.textTheme.bodyMedium?.fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                /*
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    // bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 18,
                        color: context.colorScheme.onSurface,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Harald Bregu",
                        style: TextStyle(
                          fontSize: context.textTheme.bodyMedium?.fontSize,
                          fontFamily: context.textTheme.bodyMedium?.fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                */
              ],
            ),

            const Divider(),

            // Devices section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dinamo",
                          style: TextStyle(
                            fontSize: context.textTheme.bodyMedium?.fontSize,
                            fontFamily:
                                context.textTheme.bodyMedium?.fontFamily,
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "(LEFT) 1.0.98",
                          style: TextStyle(
                            fontSize: context.textTheme.bodySmall?.fontSize,
                            fontFamily: context.textTheme.bodySmall?.fontFamily,
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: 0.35,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.onSecondary,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Dinamo",
                          style: TextStyle(
                            fontSize: context.textTheme.bodyMedium?.fontSize,
                            fontFamily:
                                context.textTheme.bodyMedium?.fontFamily,
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "(RIGHT) 1.0.98",
                          style: TextStyle(
                            fontSize: context.textTheme.bodySmall?.fontSize,
                            fontFamily: context.textTheme.bodySmall?.fontFamily,
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: 0.01,
                          minHeight: 6,
                          backgroundColor: context.colorScheme.onSecondary,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/left_shoe_uploader.svg",
                        width: 26,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        "assets/right_shoe_uploader.svg",
                        width: 26,
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            // Alert & messages center
            const InfoContainer(
              //visible: false,
              text:
                  "Caricando il programma di training nel dispositivo Dinamo (RIGHT)...",
              icon: Icons.upload,
              //loading: true,
            ),

            // Action
            Wrap(
              runSpacing: 5.0,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(
                      50,
                    ),
                  ),
                  onPressed: () {
                    onStartUploading.call(program);
                  },
                  child: const Text("UPLOAD & START"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(
                      50,
                    ),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("CLOSE"),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
