import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceCheckboxRow extends StatelessWidget {
  final String type;
  final String location;
  final String supported;
  final String version;
  final bool selected;
  final Function() onTap;

  const DeviceCheckboxRow({
    required this.selected,
    required this.type,
    required this.location,
    required this.supported,
    required this.version,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Checkbox(
                tristate: true,
                value: selected,
                onChanged: (bool? value) => onTap(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    location,
                    style: context.textTheme.bodySmall
                        ?.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                        .copyWith(
                          color: context.colorScheme.primaryFixed,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        size: 18,
                        color: context.colorScheme.primaryFixed,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "supported",
                        style: context.textTheme.bodySmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            )
                            .copyWith(
                              color: context.colorScheme.primaryFixed,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    version,
                    style: context.textTheme.bodySmall
                        ?.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                        .copyWith(
                          color: context.colorScheme.primaryFixed,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCheckboxList extends StatelessWidget {
  final List<DeviceEntity> devices;
  final List<DeviceEntity> selectedDevices;
  final Function(DeviceEntity) onSelectDevice;

  const DeviceCheckboxList({
    required this.devices,
    required this.selectedDevices,
    required this.onSelectDevice,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
      itemCount: devices.length,
      itemBuilder: (BuildContext context, int index) {
        final device = devices[index];

        return DeviceCheckboxRow(
          selected: selectedDevices.contains(device),
          type: device.type.description,
          location: device.location.description,
          supported: "supported",
          version: device.version,
          onTap: () {
            onSelectDevice(device);
          },
        );
      },
    );
  }
}
