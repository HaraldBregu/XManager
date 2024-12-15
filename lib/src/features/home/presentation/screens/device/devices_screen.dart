import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_state.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DevicesWidget(),
    );
  }
}

class DevicesWidget extends StatelessWidget {
  const DevicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
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
          onRefresh: () async {
            final bloc = context.read<DeviceBloc>();
            const event = GetDevices();
            bloc.add(event);
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Devices',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                pinned: true,
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.devices.length,
                  (BuildContext context, int index) {
                    final device = state.devices[index];

                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    device.type.value,
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
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
                                  Text(
                                    "v${device.version}",
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
