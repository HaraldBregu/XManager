import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_state.dart';

class DevicesSelectScreen extends StatelessWidget {
  const DevicesSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DeviceBloc, DeviceState>(
        buildWhen: (context, state) =>
            state is GetDevicesLoading ||
            state is GetDevicesFailure ||
            state is GetDevicesSuccess,
        builder: (context, state) {
          if (state is GetDevicesLoading) {
            context.loaderOverlay.show();
          } else if (state is GetDevicesSuccess || state is GetDevicesFailure) {
            context.loaderOverlay.hide();
          }

          return RefreshIndicator(
            onRefresh: () async =>
                context.read<DeviceBloc>().add(const GetDevices()),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    'Select devices',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  pinned: true,
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: 10,
                  ),
                ),

                // List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.devices.length,
                    (BuildContext context, int index) {
                      final device = state.devices[index];

                      final selectedDevices =
                          context.watch<DeviceBloc>().state.selectedDevices;
                      final isSelected = selectedDevices.contains(device);
/*
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: [
                            Expanded(
                              child: Checkbox(
                                tristate: true,
                                value: true,
                                onChanged: (bool? value) {},
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "type",
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    "location",
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        )
                                        .copyWith(
                                          color:
                                              context.colorScheme.primaryFixed,
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
                                              color: context
                                                  .colorScheme.primaryFixed,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "version",
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        )
                                        .copyWith(
                                          color:
                                              context.colorScheme.primaryFixed,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );*/
                      return ListTile(
                        title: Text(
                          device.type.description,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          "${device.location.value} (${device.version})",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Checkbox(
                          tristate: true,
                          value: isSelected,
                          onChanged: (bool? value) {
                            context
                                .read<DeviceBloc>()
                                .add(SelectDevice(device));
                          },
                        ),
                        onTap: () {
                          context.read<DeviceBloc>().add(SelectDevice(device));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
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
                backgroundColor: context.colorScheme.secondaryContainer,
              ),
              label: Text(
                "NEXT",
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed:
                  context.watch<DeviceBloc>().state.selectedDevices.isEmpty
                  ? null
                  : () {
                      // final bloc = context.read<HomeBloc>();
                      // context.pushNamed('program select device screen');
                      // bloc.add(const GetDevicesHomeEvent());
                      //context.pushNamed('program edit screen');
                    },
            ),
          ],
        ),
      ),
    );
  }
}
