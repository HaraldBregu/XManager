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
                      final hashCode = device.hashCode;

                      final selectedHashCode =
                          context.watch<DeviceBloc>().state.device.hashCode;

                      return ListTile(
                        title: Text(
                          device.macAddress,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        leading: Radio<int>(
                          value: hashCode,
                          groupValue: selectedHashCode,
                          onChanged: (value) {
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
              onPressed: context.watch<DeviceBloc>().state.devices == null
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
