import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_state.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_event.dart';

class ProgramUploadScreen extends StatelessWidget {
  const ProgramUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uploaderBloc = context.watch<UploaderBloc>();
    final uploaderState = uploaderBloc.state;
    final program = uploaderState.program;
    final devices = uploaderState.uploaderEntities;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Upload program',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
          ),

          // PROGRAM
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        program?.title ?? "",
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: 20,
                            color: context.colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "34:00",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 15)),

          // List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: devices.length,
              (BuildContext context, int index) {
                final deviceUpload = devices[index];
                final device = deviceUpload.device;

                final isConnecting = uploaderState is Connecting;
                final isDiscoveringServices =
                    uploaderState is DiscoveringServices;
                final isAuthenticating = uploaderState is Authenticating;
                final isUploading = uploaderState is Uploading;

                final typeValueWidget = Text(
                  device.type.value,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                );

                final locationValueWidget = Text(
                  device.location.value,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.primaryFixed,
                  ),
                );

                final statusTextWidget = Text(
                  deviceUpload.stateString,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: context.colorScheme.primaryFixed,
                  ),
                );

                final versionText = Text(
                  "v${device.version}",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.primaryFixed,
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                typeValueWidget,
                                locationValueWidget,
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                statusTextWidget,
                                versionText,
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: LinearProgressIndicator(
                          value: deviceUpload.state.value,
                          minHeight: 10,
                          backgroundColor: context.colorScheme.onSecondary,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            deviceUpload.getProgressColor(context),
                          ),
                        ),
                      ),

                      if (deviceUpload.errorMessage != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            deviceUpload.errorMessage!,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: context.colorScheme.error,
                            ),
                          ),
                        ),
                      ]
                      
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocConsumer<UploaderBloc, UploaderState>(
        listenWhen: (previous, current) {
          final stateChanged = previous != current;
          final bluetoothDisabled = current is BluetoothDisabled;
          final bluetoothConnectPermissionsDenied =
              current is BluetoothConnectPermissionsDenied;
          final bluetoothConnectPermissionsPermanentlyDenied =
              current is BluetoothConnectPermissionsPermanentlyDenied;

          return stateChanged &&
              (bluetoothConnectPermissionsDenied ||
                  bluetoothConnectPermissionsPermanentlyDenied ||
                  bluetoothDisabled);
        },
        listener: (context, state) {
          if (state is BluetoothConnectPermissionsDenied ||
              state is BluetoothConnectPermissionsPermanentlyDenied) {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Connect permissions required"),
                content: const Text(
                  "Please grant the necessary permissions to continue.",
                ),
                actions: [
                  if (state is BluetoothConnectPermissionsDenied)
                    TextButton(
                      child: const Text("GRANT PERMISSIONS"),
                      onPressed: () {
                        context.pop();
                        context
                            .read<AppBloc>()
                            .add(RequestBluetoothConnectPermission());
                      },
                    ),
                  if (state is BluetoothConnectPermissionsPermanentlyDenied)
                    TextButton(
                      child: const Text("GO TO SETTINGS"),
                      onPressed: () {
                        context.pop();
                        context.read<AppBloc>().add(GoToSettings());
                      },
                    ),
                ],
              ),
            );
            return;
          } else if (state is BluetoothDisabled) {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Bluetooth is off"),
                content: const Text("Please turn on Bluetooth to continue."),
                actions: [
                  TextButton(
                    child: const Text("TURN ON"),
                    onPressed: () {
                      context.pop();
                      context.read<AppBloc>().add(TurnOnBluetooth());
                    },
                  ),
                ],
              ),
            );
            return;
          }
        },
        builder: (contect, state) {
          return Padding(
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
                    "START UPLOADING",
                    style: TextStyle(
                      color: context.colorScheme.surface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () {
                    uploaderBloc.add(const StartUploading());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
