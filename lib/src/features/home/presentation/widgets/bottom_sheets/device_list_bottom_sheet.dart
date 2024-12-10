import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/widgets/device_checkbox_row.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

Future<void> showDeviceListBottomSheet({
  required BuildContext context,
  required DeviceProgramEntity? program,
  required List<DeviceEntity> devices,
  required Function(List<DeviceEntity> devices) onSelectDevices,
}) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final List<DeviceEntity> selectedDevices = [];

      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setState) {
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
                            style: context.textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                )
                                .copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Select devices you want to upload the program',
                            style: context.textTheme.bodySmall,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    program?.title ?? '-',
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

                    // Devices
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: DeviceCheckboxList(
                          devices: devices,
                          selectedDevices: selectedDevices,
                          onSelectDevice: (device) {
                            setState(() {
                              if (selectedDevices.contains(device)) {
                                selectedDevices.remove(device);
                              } else {
                                selectedDevices.add(device);
                              }
                            });
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
                        onPressed: selectedDevices.isNotEmpty
                            ? () => onSelectDevices(selectedDevices)
                            : null,
                        child: const Text("SELECT"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
