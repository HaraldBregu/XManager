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
    final devices = uploaderState.devices;

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

                final title =
                    "${device.type.value} ${device.location.value} (${device.version})";

                final titleText = Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
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
                                        color: context.colorScheme.primaryFixed,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: LinearProgressIndicator(
                          value: deviceUpload.progress,
                          minHeight: 10,
                          backgroundColor: context.colorScheme.onSecondary,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocConsumer<UploaderBloc, UploaderState>(
        listenWhen: (previous, current) =>
            previous != current && current is ConnectingFailure,
        listener: (context, state) {
          final denied = true;
          //state.devices == AppPermissionStatus.denied;
          final title = denied
              ? "Dispositivi nelle vicinanze"
              : "Dispositivi nelle vicinanze";
          final description = denied
              ? "Per utilizzare tutte le funzionalità dell'app, è necessario attivare il permesso Bluetooth. Attivando il Bluetooth, potrai accedere a una vasta gamma di servizi e interazioni che migliorano l'esperienza dell'app. Ti preghiamo di concedere il permesso Bluetooth per continuare. Grazie!"
              : "Per utilizzare tutte le funzionalità dell'app, è necessario attivare il permesso Bluetooth. Attivando il Bluetooth, potrai accedere a una vasta gamma di servizi e interazioni che migliorano l'esperienza dell'app. Ti preghiamo di concedere il permesso Bluetooth per continuare. Grazie!";
          final actionTitle = denied ? "ATTIVA" : "VAI IN IMPOSTAZIONI";

          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                icon: const Icon(
                  Icons.bluetooth,
                  size: 50,
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(description),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(actionTitle),
                    onPressed: () {
                      context.pop();
                      if (denied) {
                        context
                            .read<AppBloc>()
                            .add(RequestBluetoothConnectPermission());
                      } else {
                        context.read<AppBloc>().add(GoToSettings());
                      }
                    },
                  ),
                ],
              );
            },
          );
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
