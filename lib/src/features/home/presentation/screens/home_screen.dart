import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_state.dart';
import 'package:xmanager/src/features/home/presentation/widgets/device_list_bottom_sheet.dart';
import 'package:xmanager/src/features/home/presentation/widgets/home_nav_bar.dart';
import 'package:xmanager/src/features/home/presentation/widgets/program_list_bottom_sheet.dart';
import 'package:xmanager/src/features/home/presentation/widgets/program_uploader_bottom_sheet.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/shared/widgets/drawer_menu.dart';

const String bleMac = "E8:29:77:C6:A9:C0";
const String customServiceUuid = "00001600-1212-efde-1523-785feabcd121";
const String actionsCharsUuid = "00001601-1212-efde-1523-785feabcd121";
const String trainingCommandCharsUuid = "00001602-1212-efde-1523-785feabcd121";
const String trainingDataCharsUuid = "00001603-1212-efde-1523-785feabcd121";
const List<int> password = [
  56,
  148,
  132,
  156,
  147,
  134,
  152,
  174,
  236,
  7,
  185,
  208,
  186,
  98,
  59,
  181,
  202,
  0,
  77,
  147,
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontally = 25.0;

    return Scaffold(
      drawer: const DrawerMenu(),
      body: CustomScrollView(
        slivers: [
          const HomeNavBarWidget(),

          // Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: paddingHorizontally,
                top: 15,
                right: paddingHorizontally,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.loc.dashboard,
                    style: TextStyle(
                      fontSize: context.textTheme.headlineLarge?.fontSize,
                      fontFamily: context.textTheme.headlineLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Profile
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                10,
                paddingHorizontally,
                0,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                color: context.colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PROFILE",
                            style: TextStyle(
                              fontSize: context.textTheme.bodySmall?.fontSize,
                              fontFamily:
                                  context.textTheme.bodySmall?.fontFamily,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Mode",
                            style: TextStyle(
                              fontSize: context.textTheme.titleLarge?.fontSize,
                              fontFamily:
                                  context.textTheme.titleLarge?.fontFamily,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: null,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          minimumSize: Size.zero, // Set this
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ), // and this
                        ),
                        child: Text(
                          'INDIVIDUAL',
                          style: TextStyle(
                            fontSize: context.textTheme.bodySmall?.fontSize,
                            fontFamily: context.textTheme.bodySmall?.fontFamily,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Data analysis
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                10,
                paddingHorizontally,
                0,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Data analytics",
                          style: TextStyle(
                            fontSize: context.textTheme.titleLarge?.fontSize,
                            fontFamily:
                                context.textTheme.titleLarge?.fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Icon(
                          Icons.leaderboard_rounded,
                          color: context.colorScheme.primaryFixed,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Programs
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                10,
                paddingHorizontally,
                0,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    context.pushNamed("program list screen");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Programs",
                          style: TextStyle(
                            fontSize: context.textTheme.titleLarge?.fontSize,
                            fontFamily:
                                context.textTheme.titleLarge?.fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Icon(
                          Icons.inventory_2_outlined,
                          color: context.colorScheme.primaryFixed,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // DEVICES divider
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: 10,
              ),
              child: Text(
                "DEVICES",
                style: TextStyle(
                  fontSize: context.textTheme.bodySmall?.fontSize,
                  fontFamily: context.textTheme.bodySmall?.fontFamily,
                  color: context.colorScheme.inversePrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          // DEVICE list
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    context.pushNamed("device screen");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dinamo",
                              style: context.textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "LEFT FOOT",
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "V1.0.0",
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700)
                                  .copyWith(
                                    color: context.colorScheme.primaryFixed,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ACTION divider
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontally,
                vertical: 10,
              ),
              child: Text(
                "ACTIONS",
                style: TextStyle(
                  fontSize: context.textTheme.bodySmall?.fontSize,
                  fontFamily: context.textTheme.bodySmall?.fontFamily,
                  color: context.colorScheme.inversePrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          // Create new program
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                0,
                paddingHorizontally,
                10,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    context.pushNamed("program edit screen");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create new program",
                          style: TextStyle(
                            fontSize: context.textTheme.titleMedium?.fontSize,
                            fontFamily:
                                context.textTheme.titleMedium?.fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Icon(Icons.add_sharp),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Register new device
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                paddingHorizontally,
                0,
                paddingHorizontally,
                10,
              ),
              child: Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    context.pushNamed("devices scan screen");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Register new device",
                          style: TextStyle(
                            fontSize: context.textTheme.titleMedium?.fontSize,
                            fontFamily:
                                context.textTheme.titleMedium?.fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Icon(Icons.add_sharp),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              listenWhen: (previous, current) {
                return previous != current &&
                        current is AppPermissionsErrorState ||
                    current is UploadingProgramToDevicePairsState ||
                    current is BluetoothConnectingState ||
                    current is ProgramListState ||
                    current is StartUploadingState ||
                    current is SelectProgramState;
              },
              listener: (context, state) {
                if (state is AppPermissionsErrorState &&
                    state.permissionState != AppPermissionStatus.granted) {
                  final denied =
                      state.permissionState == AppPermissionStatus.denied;
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
                } else if (state is HomeDeviceConnectionErrorState) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('This is a demo alert dialog.'),
                              Text(
                                'Would you like to approve of this message?',
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (state is UploadingProgramToDevicePairsState) {
                } else if (state is ProgramListState) {
                  // Present program list
                  showProgramListBottomSheet(
                    context: context,
                    programList: state.programList,
                    onSelectProgram: (program) {
                      context.pop();
                      final bloc = context.read<HomeBloc>();
                      final event = SelectProgramEvent(program);
                      bloc.add(event);
                    },
                  );
                } else if (state is SelectProgramState) {
                  // Present devices list
                  showDeviceListBottomSheet(
                    context: context,
                    deviceList: [],
                    onSelectDevice: (program) {
                      context.pop();
                      // final bloc = context.read<HomeBloc>();
                      // final event = SelectProgramEvent(program);
                      // bloc.add(event);
                    },
                  );
                } else if (state is StartUploadingState) {
                  showModalBottomSheetProgramUploader(
                    context: context,
                    program: state.program,
                    onStartUploading: (program) {
                      final bloc = context.read<HomeBloc>();
                      final event = UploadProgramEvent(program);
                      bloc.add(event);
                    },
                  );
                }
              },
              buildWhen: (context, state) {
                return state is HomeInitialState;
              },
              builder: (context, state) {
                return FilledButton.icon(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    backgroundColor: context.colorScheme.secondaryContainer,
                  ),
                  label: Text(
                    "START TRAINING",
                    style: TextStyle(
                      color: context.colorScheme.surface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () async {
                    final bloc = context.read<HomeBloc>();
                    const event = ShowProgramListEvent();
                    bloc.add(event);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
