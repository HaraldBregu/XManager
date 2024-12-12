import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_state.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';

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

                // DEVICES
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.devices.length,
                    (BuildContext context, int index) {
                      final device = state.devices[index];

                      final selectedDevices =
                          context.watch<UploaderBloc>().state.devices;

                      final isSelected =
                          selectedDevices.any((e) => e.device == device);

                      return InkWell(
                        onTap: () {
                          context
                              .read<UploaderBloc>()
                              .add(SelectDevice(device));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 14,
                            bottom: 14,
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Checkbox(
                                  tristate: true,
                                  value: isSelected,
                                  onChanged: (bool? value) {
                                    context
                                        .read<UploaderBloc>()
                                        .add(SelectDevice(device));
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      device.type.value,
                                      style: context.textTheme.titleMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      device.location.value,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "SUPPORTED",
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
                                      "v${device.version}",
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
                            ],
                          ),
                        ),
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
              onPressed: context.watch<UploaderBloc>().state.devices.isEmpty
                  ? null
                  : () {
                      // final bloc = context.read<HomeBloc>();
                      // context.pushNamed('program select device screen');
                      // bloc.add(const GetDevicesHomeEvent());
                      context.pushNamed('upload program screen');
                    },
            ),
          ],
        ),
      ),
    );
  }
}
