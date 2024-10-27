import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

typedef SelectDevice = void Function(DeviceEntity device);

Future<void> showDeviceListBottomSheet({
  required BuildContext context,
  required List<DeviceEntity> deviceList,
  required SelectDevice onSelectDevice,
}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true, // Allows modal to resize based on content
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        //snap: true,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Top
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: 30.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),

                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Select devices",
                        style: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          fontFamily: context.textTheme.titleLarge?.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Select devices you want to upload the program',
                        style: TextStyle(
                          fontSize: context.textTheme.bodySmall?.fontSize,
                          fontFamily: context.textTheme.bodySmall?.fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),

                // Program
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Example program",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
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
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),

                // Devices
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 0,
                          color: Colors.white10,
                          indent: 0,
                          endIndent: 0,
                        );
                      },
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        //final program = programList[index];
                        final List<int> checkedItems = [];

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (checkedItems.contains(index)) {
                                    checkedItems.remove(index);
                                  } else {
                                    checkedItems.add(index);
                                  }
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Checkbox(
                                        tristate: true,
                                        value: checkedItems.contains(index),
                                        onChanged: (bool? value) {},
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dinamo",
                                            style: context.textTheme.titleMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "LEFT_FOOT",
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                )
                                                .copyWith(
                                                  color: context
                                                      .colorScheme.primaryFixed,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.check_circle_sharp,
                                                size: 18,
                                                color: context
                                                    .colorScheme.primaryFixed,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "supported device",
                                                style:
                                                    context.textTheme.bodySmall
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        )
                                                        .copyWith(
                                                          color: context
                                                              .colorScheme
                                                              .primaryFixed,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "1.0.0",
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                )
                                                .copyWith(
                                                  color: context.colorScheme
                                                      .inversePrimary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                // Action button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(
                        50,
                      ),
                    ),
                    onPressed: () {
                      //onStartUploading.call(program);
                    },
                    child: const Text("UPLOAD & START"),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            // Top
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 30.0,
              height: 3.0,
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select devices",
                        style: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          fontFamily: context.textTheme.titleLarge?.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Select devices you want to upload the program',
                        style: TextStyle(
                          fontSize: context.textTheme.bodySmall?.fontSize,
                          fontFamily: context.textTheme.bodySmall?.fontFamily,
                        ),
                      ),
                    ],
                  ),

                  // Space
                  const SizedBox(height: 20),

                  // Program
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Example program",
                                  style: context.textTheme.bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w400),
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
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),

                  // Space
                  const SizedBox(height: 20),

                  // Devices
                  ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 0,
                        color: Colors.white10,
                        indent: 0,
                        endIndent: 0,
                      );
                    },
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      //final program = programList[index];

                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "program.title",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
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
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Space
            //const SizedBox(height: 40),

            // Action
            Padding(
              padding: const EdgeInsets.all(20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(
                    50,
                  ),
                ),
                onPressed: () {
                  //onStartUploading.call(program);
                },
                child: const Text("UPLOAD & START"),
              ),
            ),
          ],
        ),
      );
    },
  );
}
