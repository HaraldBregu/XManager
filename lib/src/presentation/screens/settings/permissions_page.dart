import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});
  @override
  State<PermissionsPage> createState() => _PermissionsState();
}

class _PermissionsState extends State<PermissionsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permissions")),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: Permission.values
              .where((permission) {

            final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
            if (isIOS) {
              return permission != Permission.unknown &&
                  permission != Permission.sms &&
                  permission != Permission.storage &&
                  permission != Permission.ignoreBatteryOptimizations &&
                  permission != Permission.accessMediaLocation &&
                  permission != Permission.activityRecognition &&
                  permission != Permission.manageExternalStorage &&
                  permission != Permission.systemAlertWindow &&
                  permission != Permission.requestInstallPackages &&
                  permission != Permission.accessNotificationPolicy &&
                  permission != Permission.bluetoothScan &&
                  permission != Permission.bluetoothAdvertise &&
                  permission != Permission.bluetoothConnect;
            } else {
              return permission != Permission.unknown &&
                  permission != Permission.mediaLibrary &&
                  permission != Permission.photos &&
                  permission != Permission.photosAddOnly &&
                  permission != Permission.reminders &&
                  permission != Permission.appTrackingTransparency &&
                  permission != Permission.criticalAlerts;
            }
          }).map((permission) => PermissionWidget(permission)).toList()),

    );
  }
}




/// Permission shared containing information about the passed [Permission]
class PermissionWidget extends StatefulWidget {
  final Permission _permission;

  const PermissionWidget(this._permission);

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  Future<void> _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return ListTile(
      title: Text(_permission.toString(), style: textTheme.titleMedium),
      subtitle: Text(_permissionStatus.toString(), style: TextStyle(color: getPermissionColor())),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(Icons.info),
          onPressed: () => checkServiceStatus(context, _permission as PermissionWithService)) : null,
      onTap: () => requestPermission(_permission),
    );
  }

  void checkServiceStatus(
      BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;
    });
  }
}
